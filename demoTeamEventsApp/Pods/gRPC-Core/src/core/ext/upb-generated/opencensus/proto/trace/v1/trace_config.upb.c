/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     opencensus/proto/trace/v1/trace_config.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/msg_internal.h"
#include "opencensus/proto/trace/v1/trace_config.upb.h"

#include "upb/port_def.inc"

static const upb_MiniTable_Sub opencensus_proto_trace_v1_TraceConfig_submsgs[3] = {
  {.submsg = &opencensus_proto_trace_v1_ProbabilitySampler_msginit},
  {.submsg = &opencensus_proto_trace_v1_ConstantSampler_msginit},
  {.submsg = &opencensus_proto_trace_v1_RateLimitingSampler_msginit},
};

static const upb_MiniTable_Field opencensus_proto_trace_v1_TraceConfig__fields[7] = {
  {1, UPB_SIZE(4, 8), UPB_SIZE(-1, -1), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(4, 8), UPB_SIZE(-1, -1), 1, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(4, 8), UPB_SIZE(-1, -1), 2, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(8, 16), UPB_SIZE(0, 0), kUpb_NoSub, 3, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)},
  {5, UPB_SIZE(16, 24), UPB_SIZE(0, 0), kUpb_NoSub, 3, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)},
  {6, UPB_SIZE(24, 32), UPB_SIZE(0, 0), kUpb_NoSub, 3, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)},
  {7, UPB_SIZE(32, 40), UPB_SIZE(0, 0), kUpb_NoSub, 3, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable opencensus_proto_trace_v1_TraceConfig_msginit = {
  &opencensus_proto_trace_v1_TraceConfig_submsgs[0],
  &opencensus_proto_trace_v1_TraceConfig__fields[0],
  UPB_SIZE(40, 48), 7, kUpb_ExtMode_NonExtendable, 7, 255, 0,
};

static const upb_MiniTable_Field opencensus_proto_trace_v1_ProbabilitySampler__fields[1] = {
  {1, UPB_SIZE(0, 0), UPB_SIZE(0, 0), kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable opencensus_proto_trace_v1_ProbabilitySampler_msginit = {
  NULL,
  &opencensus_proto_trace_v1_ProbabilitySampler__fields[0],
  UPB_SIZE(8, 8), 1, kUpb_ExtMode_NonExtendable, 1, 255, 0,
};

static const upb_MiniTable_Field opencensus_proto_trace_v1_ConstantSampler__fields[1] = {
  {1, UPB_SIZE(0, 0), UPB_SIZE(0, 0), kUpb_NoSub, 5, kUpb_FieldMode_Scalar | (kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable opencensus_proto_trace_v1_ConstantSampler_msginit = {
  NULL,
  &opencensus_proto_trace_v1_ConstantSampler__fields[0],
  UPB_SIZE(8, 8), 1, kUpb_ExtMode_NonExtendable, 1, 255, 0,
};

static const upb_MiniTable_Field opencensus_proto_trace_v1_RateLimitingSampler__fields[1] = {
  {1, UPB_SIZE(0, 0), UPB_SIZE(0, 0), kUpb_NoSub, 3, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable opencensus_proto_trace_v1_RateLimitingSampler_msginit = {
  NULL,
  &opencensus_proto_trace_v1_RateLimitingSampler__fields[0],
  UPB_SIZE(8, 8), 1, kUpb_ExtMode_NonExtendable, 1, 255, 0,
};

static const upb_MiniTable *messages_layout[4] = {
  &opencensus_proto_trace_v1_TraceConfig_msginit,
  &opencensus_proto_trace_v1_ProbabilitySampler_msginit,
  &opencensus_proto_trace_v1_ConstantSampler_msginit,
  &opencensus_proto_trace_v1_RateLimitingSampler_msginit,
};

const upb_MiniTable_File opencensus_proto_trace_v1_trace_config_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  4,
  0,
  0,
};

#include "upb/port_undef.inc"

