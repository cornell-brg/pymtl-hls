#include <assert.h>
#include <stdio.h>
#include "ap_utils.h"

#include "../hls/include/common.h"

DstuIfaceType g_dstu_iface;

typedef ap_uint<3> PredicateType;

// ------------------------------------------------------------------
// Polymorphic User Algorithm
// findif
// ------------------------------------------------------------------
template <typename Iterator>
Iterator findif (Iterator first, Iterator last, PredicateType pred_val) {
  while (first != last) {
    typename Iterator::value_type temp = *first;
    switch (pred_val) {
      case 0:
        if (temp > 1) return first;
        break;
      case 1:
        if (temp < 1) return first;
        break;
      case 2:
        if (temp == 0) return first;
        break;
      case 3:
        if ((temp % 2) == 1) return first;
        break;
      case 4:
        if ((temp % 2) == 0) return first;
        break;
    };
    ++first;
  }
  return last;
}

// ------------------------------------------------------------------
// FindIfUnitHLS Wrapper
// This function takes care of the accelerator interface to the
// processor, and calls the user algorithm
// ------------------------------------------------------------------
void FindIfUnitHLS (AcIfaceType &ac, MemIfaceType &mem)
{
  // state variables
  static AcDataType s_first_ds_id;
  static AcDataType s_first_index;
  static AcDataType s_last_ds_id;
  static AcDataType s_last_index;
  static PredicateType s_pred;
  static AcDataType s_dt_desc_ptr;
  static AcDataType s_result;

  AcReqMsg req;
  AcRespMsg resp;
  MetaData metadata;

  // 1. First ds id
  ac.req.read( req );
  s_first_ds_id = req.data;
  ac.resp.write( AcRespMsg( req.id, 0, req.type, req.opq ) );

  // 2. First index
  ac.req.read( req );
  s_first_index = req.data;
  ac.resp.write( AcRespMsg( req.id, 0, req.type, req.opq ) );

  // 3. Last ds id
  ac.req.read( req );
  s_last_ds_id = req.data;
  ac.resp.write( AcRespMsg( req.id, 0, req.type, req.opq ) );

  // 4. Last index
  ac.req.read( req );
  s_last_index = req.data;
  ac.resp.write( AcRespMsg( req.id, 0, req.type, req.opq ) );

  // 5. Predicate
  ac.req.read( req );
  s_pred = req.data;
  ac.resp.write( AcRespMsg( req.id, 0, req.type, req.opq ) );

  // 6. metadata ptr
  ac.req.read( req );
  s_dt_desc_ptr = req.data;
  ac.resp.write( AcRespMsg( req.id, 0, req.type, req.opq ) );

  // 7. start
  ac.req.read( req );
  ac.resp.write( AcRespMsg( req.id, 0, req.type, req.opq ) );

  // Compute
  #ifdef CPP_COMPILE
    unsigned md[MAX_FIELDS];
    /*
    // descripter for point
    SET_OFFSET( md[0], 0               );
    SET_SIZE  ( md[0], sizeof( Point ) );
    SET_TYPE  ( md[0], TYPE_POINT      );
    SET_FIELDS( md[0], 3               );
    // descriptor for label
    SET_OFFSET( md[1], 0               );
    SET_SIZE  ( md[1], sizeof( int   ) );
    SET_TYPE  ( md[1], TYPE_SHORT      );
    SET_FIELDS( md[1], 0               );
    // descriptor for x
    SET_OFFSET( md[2], 4               );
    SET_SIZE  ( md[2], sizeof( int   ) );
    SET_TYPE  ( md[2], TYPE_INT        );
    SET_FIELDS( md[2], 0               );
    // descriptor for y
    SET_OFFSET( md[3], 8               );
    SET_SIZE  ( md[3], sizeof( int   ) );
    SET_TYPE  ( md[3], TYPE_INT        );
    SET_FIELDS( md[3], 0               );*/
    SET_OFFSET( md[0], 0               );
    SET_SIZE  ( md[0], sizeof( int   ) );
    SET_TYPE  ( md[0], TYPE_INT        );
    SET_FIELDS( md[0], 0               );
    metadata.init(md);
  #else
    mem_read_metadata (mem, s_dt_desc_ptr, metadata);
  #endif

  unsigned md0 = metadata.getData(0);
  ap_uint<8> type = GET_TYPE(md0);
  ap_uint<8> fields = GET_FIELDS(md0);

  s_result = findif<PolyHSIterator> (
               PolyHSIterator(s_first_ds_id, s_first_index, type, fields),
               PolyHSIterator(s_last_ds_id, s_last_index, type, fields),
               s_pred
             ).get_index();

  // 8. Return result
  ac.req.read( req );
  ac.resp.write( AcRespMsg( req.id, s_result, req.type, req.opq ) );
}

// ------------------------------------------------------------------
// dstu model for simulation
// ------------------------------------------------------------------

// dstu_preprocess
//  Writes [n+1] pieces of data into the dstu resp queue, the
//  last piece of data is the zero
void dstu_preprocess( AcIdType id, const unsigned n ) {
  // id, data, rw type, opaque
  for (int i = 0; i < n; ++i) {
    g_dstu_iface.resp.write( DstuRespMsg( id, i+1, 0, 0 ));
  }
  g_dstu_iface.resp.write( DstuRespMsg( id, 0, 0, 0 ));
}

// dstu_postprocess
//  Reads [n+1] pieces of data from the dstu req queue
void dstu_postprocess( const unsigned n ) {
  DstuReqMsg req;
  for (int i = 0; i <= n; ++i) {
    g_dstu_iface.req.read( req );
  }
}

// ------------------------------------------------------------------
// helpers for main
// ------------------------------------------------------------------
bool test_findif ( const unsigned n ) {
  AcIfaceType ac_iface;
  MemIfaceType mem_iface;
  AcDataType data;
  AcAddrType raddr;
  MetaData* m = MetaCreator<unsigned>::get();
  AcRespMsg resp;

  AcIdType id = 0;

  // 1. set first ds id
  data = 0;   raddr = 1;
  ac_iface.req.write( AcReqMsg( id, data, raddr, MSG_WRITE, 0 ) );
  // 2. set first index
  data = 0;   raddr = 2;
  ac_iface.req.write( AcReqMsg( id, data, raddr, MSG_WRITE, 0 ) );
  // 3. set last ds id
  data = 0;   raddr = 3;
  ac_iface.req.write( AcReqMsg( id, data, raddr, MSG_WRITE, 0 ) );
  // 4. set last index
  data = n+1; raddr = 4;
  ac_iface.req.write( AcReqMsg( id, data, raddr, MSG_WRITE, 0 ) );
  // 5. set pred
  data = 2;   raddr = 5;
  ac_iface.req.write( AcReqMsg( id, data, raddr, MSG_WRITE, 0 ) );
  // 6. set metadata pointer
  data = m;   raddr = 6;
  ac_iface.req.write( AcReqMsg( id, data, raddr, MSG_WRITE, 0 ) );
  // 7. start accelerator
  data = 0;   raddr = 0;
  ac_iface.req.write( AcReqMsg( id, data, raddr, MSG_WRITE, 0 ) );
  // 8. read result
  data = 0;   raddr = 0;
  ac_iface.req.write( AcReqMsg( id, data, raddr, MSG_READ, 0 ) );

  dstu_preprocess( id, n );

  FindIfUnitHLS( ac_iface, mem_iface );
  
  dstu_postprocess( n );
  
  ac_iface.resp.read( resp );
  ac_iface.resp.read( resp );
  ac_iface.resp.read( resp );
  ac_iface.resp.read( resp );
  ac_iface.resp.read( resp );
  ac_iface.resp.read( resp );
  ac_iface.resp.read( resp );
  ac_iface.resp.read( resp );

  unsigned s = resp.data;
  printf ("--------------------\n");
  printf ("Expected : %X\n", n);
  printf ("Result   : %X\n", s);
  printf ("--------------------\n");

  return n == s;
}

// ------------------------------------------------------------------
// main
// ------------------------------------------------------------------
int main () {
  for (int i = 0; i < 10; ++i) {
    assert( test_findif( i ) );
  }
  printf ("All tests passed\n");
  return 0;
}
