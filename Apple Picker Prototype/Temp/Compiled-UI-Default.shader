// Compiled shader for PC, Mac & Linux Standalone

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "UI/Default" {
Properties {
[PerRendererData]  _MainTex ("Sprite Texture", 2D) = "white" { }
 _Color ("Tint", Color) = (1.000000,1.000000,1.000000,1.000000)
 _StencilComp ("Stencil Comparison", Float) = 8.000000
 _Stencil ("Stencil ID", Float) = 0.000000
 _StencilOp ("Stencil Operation", Float) = 0.000000
 _StencilWriteMask ("Stencil Write Mask", Float) = 255.000000
 _StencilReadMask ("Stencil Read Mask", Float) = 255.000000
 _ColorMask ("Color Mask", Float) = 15.000000
[Toggle(UNITY_UI_ALPHACLIP)]  _UseUIAlphaClip ("Use Alpha Clip", Float) = 0.000000
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" "PreviewType"="Plane" "CanUseSpriteAtlas"="true" }


 // Stats for Vertex shader:
 //        d3d11: 9 math
 // Stats for Fragment shader:
 //        d3d11: 6 avg math (2..10), 1 texture
 Pass {
  Name "DEFAULT"
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" "PreviewType"="Plane" "CanUseSpriteAtlas"="true" }
  ZTest [unity_GUIZTestMode]
  ZWrite Off
  Cull Off
  Stencil {
   Ref [_Stencil]
   ReadMask [_StencilReadMask]
   WriteMask [_StencilWriteMask]
   Comp [_StencilComp]
   Pass [_StencilOp]
  }
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask [_ColorMask]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
No keywords set in this variant.
-- Vertex shader for "d3d11":
// Stats: 9 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord"

Constant Buffer "$Globals" (80 bytes) on slot 0 {
  Vector4 _Color at 32
}
Constant Buffer "UnityPerDraw" (160 bytes) on slot 1 {
  Matrix4x4 unity_ObjectToWorld at 0
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 2 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[3], immediateIndexed
      dcl_constantbuffer CB1[4], immediateIndexed
      dcl_constantbuffer CB2[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyzw
      dcl_input v2.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xy
      dcl_output o3.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb1[1].xyzw
   1: mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb1[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb2[18].xyzw
   5: mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
   8: mul o1.xyzw, v1.xyzw, cb0[2].xyzw
   9: mov o2.xy, v2.xyxx
  10: mov o3.xyzw, v0.xyzw
  11: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// Stats: 2 math, 1 temp registers, 1 textures
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (80 bytes) on slot 0 {
  Vector4 _TextureSampleAdd at 48
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xyzw        3     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[4], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_input_ps linear v1.xyzw
      dcl_input_ps linear v2.xy
      dcl_output o0.xyzw
      dcl_temps 1
   0: sample r0.xyzw, v2.xyxx, t0.xyzw, s0
   1: add r0.xyzw, r0.xyzw, cb0[3].xyzw
   2: mul o0.xyzw, r0.xyzw, v1.xyzw
   3: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: UNITY_UI_ALPHACLIP 
-- Vertex shader for "d3d11":
// Stats: 9 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord"

Constant Buffer "$Globals" (80 bytes) on slot 0 {
  Vector4 _Color at 32
}
Constant Buffer "UnityPerDraw" (160 bytes) on slot 1 {
  Matrix4x4 unity_ObjectToWorld at 0
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 2 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[3], immediateIndexed
      dcl_constantbuffer CB1[4], immediateIndexed
      dcl_constantbuffer CB2[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyzw
      dcl_input v2.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xy
      dcl_output o3.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb1[1].xyzw
   1: mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb1[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb2[18].xyzw
   5: mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
   8: mul o1.xyzw, v1.xyzw, cb0[2].xyzw
   9: mov o2.xy, v2.xyxx
  10: mov o3.xyzw, v0.xyzw
  11: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// Stats: 4 math, 2 temp registers, 1 textures
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (80 bytes) on slot 0 {
  Vector4 _TextureSampleAdd at 48
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xyzw        3     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[4], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_input_ps linear v1.xyzw
      dcl_input_ps linear v2.xy
      dcl_output o0.xyzw
      dcl_temps 2
   0: sample r0.xyzw, v2.xyxx, t0.xyzw, s0
   1: add r0.xyzw, r0.xyzw, cb0[3].xyzw
   2: mad r1.x, r0.w, v1.w, l(-0.001000)
   3: mul r0.xyzw, r0.xyzw, v1.xyzw
   4: mov o0.xyzw, r0.xyzw
   5: lt r0.x, r1.x, l(0.000000)
   6: discard_nz r0.x
   7: ret 
// Approximately 0 instruction slots used


-- Vertex shader for "d3d11":
// Stats: 9 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord"

Constant Buffer "$Globals" (80 bytes) on slot 0 {
  Vector4 _Color at 32
}
Constant Buffer "UnityPerDraw" (160 bytes) on slot 1 {
  Matrix4x4 unity_ObjectToWorld at 0
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 2 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[3], immediateIndexed
      dcl_constantbuffer CB1[4], immediateIndexed
      dcl_constantbuffer CB2[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyzw
      dcl_input v2.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xy
      dcl_output o3.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb1[1].xyzw
   1: mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb1[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb2[18].xyzw
   5: mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
   8: mul o1.xyzw, v1.xyzw, cb0[2].xyzw
   9: mov o2.xy, v2.xyxx
  10: mov o3.xyzw, v0.xyzw
  11: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// Stats: 8 math, 2 temp registers, 1 textures
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (80 bytes) on slot 0 {
  Vector4 _TextureSampleAdd at 48
  Vector4 _ClipRect at 64
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xyzw        3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[5], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_input_ps linear v1.xyzw
      dcl_input_ps linear v2.xy
      dcl_input_ps linear v3.xy
      dcl_output o0.xyzw
      dcl_temps 2
   0: ge r0.xy, v3.xyxx, cb0[4].xyxx
   1: ge r0.zw, cb0[4].zzzw, v3.xxxy
   2: and r0.xyzw, r0.xyzw, l(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000)
   3: mul r0.xy, r0.zwzz, r0.xyxx
   4: mul r0.x, r0.y, r0.x
   5: sample r1.xyzw, v2.xyxx, t0.xyzw, s0
   6: add r1.xyzw, r1.xyzw, cb0[3].xyzw
   7: mul r1.xyzw, r1.xyzw, v1.xyzw
   8: mul o0.w, r0.x, r1.w
   9: mov o0.xyz, r1.xyzx
  10: ret 
// Approximately 0 instruction slots used


//////////////////////////////////////////////////////
Keywords set in this variant: UNITY_UI_CLIP_RECT UNITY_UI_ALPHACLIP 
-- Vertex shader for "d3d11":
// Stats: 9 math, 2 temp registers
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord"

Constant Buffer "$Globals" (80 bytes) on slot 0 {
  Vector4 _Color at 32
}
Constant Buffer "UnityPerDraw" (160 bytes) on slot 1 {
  Matrix4x4 unity_ObjectToWorld at 0
}
Constant Buffer "UnityPerFrame" (368 bytes) on slot 2 {
  Matrix4x4 unity_MatrixVP at 272
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// POSITION                 0   xyzw        0     NONE   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float   xyzw
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
//
      vs_4_0
      dcl_constantbuffer CB0[3], immediateIndexed
      dcl_constantbuffer CB1[4], immediateIndexed
      dcl_constantbuffer CB2[21], immediateIndexed
      dcl_input v0.xyzw
      dcl_input v1.xyzw
      dcl_input v2.xy
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xy
      dcl_output o3.xyzw
      dcl_temps 2
   0: mul r0.xyzw, v0.yyyy, cb1[1].xyzw
   1: mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
   2: mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
   3: add r0.xyzw, r0.xyzw, cb1[3].xyzw
   4: mul r1.xyzw, r0.yyyy, cb2[18].xyzw
   5: mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
   6: mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
   7: mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
   8: mul o1.xyzw, v1.xyzw, cb0[2].xyzw
   9: mov o2.xy, v2.xyxx
  10: mov o3.xyzw, v0.xyzw
  11: ret 
// Approximately 0 instruction slots used


-- Fragment shader for "d3d11":
// Stats: 10 math, 2 temp registers, 1 textures
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "$Globals" (80 bytes) on slot 0 {
  Vector4 _TextureSampleAdd at 48
  Vector4 _ClipRect at 64
}

Shader Disassembly:
//
// Generated by Microsoft (R) D3D Shader Disassembler
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_POSITION              0   xyzw        0      POS   float       
// COLOR                    0   xyzw        1     NONE   float   xyzw
// TEXCOORD                 0   xy          2     NONE   float   xy  
// TEXCOORD                 1   xyzw        3     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
      ps_4_0
      dcl_constantbuffer CB0[5], immediateIndexed
      dcl_sampler s0, mode_default
      dcl_resource_texture2d (float,float,float,float) t0
      dcl_input_ps linear v1.xyzw
      dcl_input_ps linear v2.xy
      dcl_input_ps linear v3.xy
      dcl_output o0.xyzw
      dcl_temps 2
   0: ge r0.xy, v3.xyxx, cb0[4].xyxx
   1: ge r0.zw, cb0[4].zzzw, v3.xxxy
   2: and r0.xyzw, r0.xyzw, l(0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000)
   3: mul r0.xy, r0.zwzz, r0.xyxx
   4: mul r0.x, r0.y, r0.x
   5: sample r1.xyzw, v2.xyxx, t0.xyzw, s0
   6: add r1.xyzw, r1.xyzw, cb0[3].xyzw
   7: mul r1.xyzw, r1.xyzw, v1.xyzw
   8: mad r0.y, r1.w, r0.x, l(-0.001000)
   9: mul r0.x, r0.x, r1.w
  10: mov o0.xyz, r1.xyzx
  11: mov o0.w, r0.x
  12: lt r0.x, r0.y, l(0.000000)
  13: discard_nz r0.x
  14: ret 
// Approximately 0 instruction slots used


 }
}
}