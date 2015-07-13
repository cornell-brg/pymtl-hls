#include "ap_utils.h"
#include "assert.h"

#include "../hls/include/Types.h"

// ------------------------------------------------------------------
// Specialized Processing Element
// Compare Equal to Zero
//  - first reads the number of args
//  - then reads n_args data points
//  - on the last response returns the result of the comparison
// ------------------------------------------------------------------
void EqZero( PeIfaceType &pe ) {
  PeReqMsg  req;
  bool result = true;

  // read number of args
  pe.req.read( req );
  PeDataType n_args = req.data;
  pe.resp.write( PeRespMsg( req.id, req.type, 0 ) );

  // read args
  for (PeDataType i = 0; i < n_args; ++i) {
    pe.req.read( req );
    pe.resp.write( PeRespMsg( req.id, req.type, 0 ) );
    result &= req.data == 0;
  }

  // write result
  pe.req.read( req );
  pe.resp.write( PeRespMsg( req.id, req.type, result ) );
}

// ------------------------------------------------------------------
// ASU model for simulation
// ------------------------------------------------------------------

// asu_postprocess
//  Writes 3x[n+1] pieces of data to the pe req queue
//  First [n] data are non-zeros, last data is a zero
void asu_preprocess( PeIfaceType& iface, PeIdType id, const int n ) {
  for (int i = 0; i < n; ++i) {
    // write num of args
    iface.req.write( PeReqMsg( id, MSG_WRITE, 2 ) );
    // write x value
    iface.req.write( PeReqMsg( id, MSG_WRITE, i+1 ) );
    // write y value
    iface.req.write( PeReqMsg( id, MSG_WRITE, i+1 ) );
    // read result
    iface.req.write( PeReqMsg( id, MSG_READ, 0 ) );
  }
  iface.req.write( PeReqMsg( id, MSG_WRITE, 2 ) );
  iface.req.write( PeReqMsg( id, MSG_WRITE, 0 ) );
  iface.req.write( PeReqMsg( id, MSG_WRITE, 0 ) );
  iface.req.write( PeReqMsg( id, MSG_READ, 0 ) );
}

// asu_postprocess
//  Reads 3x[n] piece of data from the pe resp queue
//  All data should be zeros
void asu_postprocess( PeIfaceType& iface, const int n ) {
  PeRespMsg resp;
  for (int i = 0; i < n; ++i) {
    iface.resp.read( resp );
    iface.resp.read( resp );
    iface.resp.read( resp );
    iface.resp.read( resp );
    assert( resp.data == 0 );
  }
}

// ------------------------------------------------------------------
// helpers for main
// ------------------------------------------------------------------
bool test_eqzero( const unsigned n ) {
  PeIfaceType iface;
  PeIdType id = 0;

  asu_preprocess( iface, id, n );

  for (int i = 0; i <= n; ++i) {
    EqZero( iface );
  }
  
  asu_postprocess( iface, n );

  // read the last response, which should be a non-zero
  PeRespMsg resp;
  iface.resp.read( resp );
  iface.resp.read( resp );
  iface.resp.read( resp );
  iface.resp.read( resp );
  int s = resp.data;
  printf ("--------------------\n");
  printf ("Expected : nonzero (%d elements)\n", n);
  printf ("Result   : %X\n", s);
  printf ("--------------------\n");
  
  return s != 0;
}

// ------------------------------------------------------------------
// main
// ------------------------------------------------------------------
int main () {
  for (int i = 0; i < 10; ++i) {
    assert( test_eqzero( i ) );
  }
  printf ("All tests passed\n");
  return 0;
}

