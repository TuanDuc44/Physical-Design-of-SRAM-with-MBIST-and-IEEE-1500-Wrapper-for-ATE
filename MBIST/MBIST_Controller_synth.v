/* Generated by Yosys 0.51+46 (git sha1 8bde6ac17, g++ 11.4.0-1ubuntu1~22.04 -fPIC -O3) */

module MBIST_Controller(clk, rst_n, start_bist, bist_done, bist_pass, csb0, web0, addr0, din0, dout0);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire [2:0] _154_;
  wire [9:0] _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  output [8:0] addr0;
  wire [8:0] addr0;
  wire [9:0] addr_cnt;
  output bist_done;
  wire bist_done;
  output bist_pass;
  wire bist_pass;
  input clk;
  wire clk;
  output csb0;
  wire csb0;
  output [31:0] din0;
  wire [31:0] din0;
  input [31:0] dout0;
  wire [31:0] dout0;
  input rst_n;
  wire rst_n;
  input start_bist;
  wire start_bist;
  wire [2:0] state;
  output web0;
  wire web0;
  sky130_fd_sc_hd__clkinv_1 _160_ (
    .A(addr_cnt[7]),
    .Y(_041_)
  );
  sky130_fd_sc_hd__clkinv_1 _161_ (
    .A(addr_cnt[9]),
    .Y(_042_)
  );
  sky130_fd_sc_hd__nor2_1 _162_ (
    .A(state[1]),
    .B(state[0]),
    .Y(_043_)
  );
  sky130_fd_sc_hd__nor3_1 _163_ (
    .A(state[1]),
    .B(state[0]),
    .C(state[2]),
    .Y(_044_)
  );
  sky130_fd_sc_hd__o21ai_0 _164_ (
    .A1(state[1]),
    .A2(state[0]),
    .B1(state[2]),
    .Y(_045_)
  );
  sky130_fd_sc_hd__nor2b_1 _165_ (
    .A(_044_),
    .B_N(_045_),
    .Y(_046_)
  );
  sky130_fd_sc_hd__nand2b_1 _166_ (
    .A_N(_044_),
    .B(_045_),
    .Y(_047_)
  );
  sky130_fd_sc_hd__nand2_1 _167_ (
    .A(rst_n),
    .B(_046_),
    .Y(_048_)
  );
  sky130_fd_sc_hd__mux2_1 _168_ (
    .A0(addr_cnt[5]),
    .A1(addr0[5]),
    .S(_048_),
    .X(_005_)
  );
  sky130_fd_sc_hd__mux2_1 _169_ (
    .A0(addr_cnt[6]),
    .A1(addr0[6]),
    .S(_048_),
    .X(_006_)
  );
  sky130_fd_sc_hd__nand2_1 _170_ (
    .A(addr0[7]),
    .B(_048_),
    .Y(_049_)
  );
  sky130_fd_sc_hd__o21ai_0 _171_ (
    .A1(_041_),
    .A2(_048_),
    .B1(_049_),
    .Y(_007_)
  );
  sky130_fd_sc_hd__mux2_1 _172_ (
    .A0(addr_cnt[8]),
    .A1(addr0[8]),
    .S(_048_),
    .X(_008_)
  );
  sky130_fd_sc_hd__lpflow_isobufsrc_1 _173_ (
    .A(state[0]),
    .SLEEP(state[1]),
    .X(_050_)
  );
  sky130_fd_sc_hd__lpflow_isobufsrc_1 _174_ (
    .A(_050_),
    .SLEEP(state[2]),
    .X(_051_)
  );
  sky130_fd_sc_hd__nand2_1 _175_ (
    .A(rst_n),
    .B(_051_),
    .Y(_052_)
  );
  sky130_fd_sc_hd__nand2_1 _176_ (
    .A(din0[0]),
    .B(_052_),
    .Y(_053_)
  );
  sky130_fd_sc_hd__nand4b_1 _177_ (
    .A_N(state[2]),
    .B(rst_n),
    .C(state[1]),
    .D(state[0]),
    .Y(_054_)
  );
  sky130_fd_sc_hd__nand2_1 _178_ (
    .A(_053_),
    .B(_054_),
    .Y(_009_)
  );
  sky130_fd_sc_hd__nand2_1 _179_ (
    .A(din0[1]),
    .B(_052_),
    .Y(_055_)
  );
  sky130_fd_sc_hd__nand2_1 _180_ (
    .A(_054_),
    .B(_055_),
    .Y(_020_)
  );
  sky130_fd_sc_hd__nand2_1 _181_ (
    .A(din0[2]),
    .B(_052_),
    .Y(_056_)
  );
  sky130_fd_sc_hd__nand2_1 _182_ (
    .A(_054_),
    .B(_056_),
    .Y(_031_)
  );
  sky130_fd_sc_hd__nand2_1 _183_ (
    .A(din0[3]),
    .B(_052_),
    .Y(_057_)
  );
  sky130_fd_sc_hd__nand2_1 _184_ (
    .A(_054_),
    .B(_057_),
    .Y(_034_)
  );
  sky130_fd_sc_hd__nand2_1 _185_ (
    .A(din0[4]),
    .B(_052_),
    .Y(_058_)
  );
  sky130_fd_sc_hd__nand2_1 _186_ (
    .A(_054_),
    .B(_058_),
    .Y(_035_)
  );
  sky130_fd_sc_hd__nand2_1 _187_ (
    .A(din0[5]),
    .B(_052_),
    .Y(_059_)
  );
  sky130_fd_sc_hd__nand2_1 _188_ (
    .A(_054_),
    .B(_059_),
    .Y(_036_)
  );
  sky130_fd_sc_hd__nand2_1 _189_ (
    .A(din0[6]),
    .B(_052_),
    .Y(_060_)
  );
  sky130_fd_sc_hd__nand2_1 _190_ (
    .A(_054_),
    .B(_060_),
    .Y(_037_)
  );
  sky130_fd_sc_hd__nand2_1 _191_ (
    .A(din0[7]),
    .B(_052_),
    .Y(_061_)
  );
  sky130_fd_sc_hd__nand2_1 _192_ (
    .A(_054_),
    .B(_061_),
    .Y(_038_)
  );
  sky130_fd_sc_hd__nand2_1 _193_ (
    .A(din0[8]),
    .B(_052_),
    .Y(_062_)
  );
  sky130_fd_sc_hd__nand2_1 _194_ (
    .A(_054_),
    .B(_062_),
    .Y(_039_)
  );
  sky130_fd_sc_hd__nand2_1 _195_ (
    .A(din0[9]),
    .B(_052_),
    .Y(_063_)
  );
  sky130_fd_sc_hd__nand2_1 _196_ (
    .A(_054_),
    .B(_063_),
    .Y(_040_)
  );
  sky130_fd_sc_hd__nand2_1 _197_ (
    .A(din0[10]),
    .B(_052_),
    .Y(_064_)
  );
  sky130_fd_sc_hd__nand2_1 _198_ (
    .A(_054_),
    .B(_064_),
    .Y(_010_)
  );
  sky130_fd_sc_hd__nand2_1 _199_ (
    .A(din0[11]),
    .B(_052_),
    .Y(_065_)
  );
  sky130_fd_sc_hd__nand2_1 _200_ (
    .A(_054_),
    .B(_065_),
    .Y(_011_)
  );
  sky130_fd_sc_hd__nand2_1 _201_ (
    .A(din0[12]),
    .B(_052_),
    .Y(_066_)
  );
  sky130_fd_sc_hd__nand2_1 _202_ (
    .A(_054_),
    .B(_066_),
    .Y(_012_)
  );
  sky130_fd_sc_hd__nand2_1 _203_ (
    .A(din0[13]),
    .B(_052_),
    .Y(_067_)
  );
  sky130_fd_sc_hd__nand2_1 _204_ (
    .A(_054_),
    .B(_067_),
    .Y(_013_)
  );
  sky130_fd_sc_hd__nand2_1 _205_ (
    .A(din0[14]),
    .B(_052_),
    .Y(_068_)
  );
  sky130_fd_sc_hd__nand2_1 _206_ (
    .A(_054_),
    .B(_068_),
    .Y(_014_)
  );
  sky130_fd_sc_hd__nand2_1 _207_ (
    .A(din0[15]),
    .B(_052_),
    .Y(_069_)
  );
  sky130_fd_sc_hd__nand2_1 _208_ (
    .A(_054_),
    .B(_069_),
    .Y(_015_)
  );
  sky130_fd_sc_hd__nand2_1 _209_ (
    .A(din0[16]),
    .B(_052_),
    .Y(_070_)
  );
  sky130_fd_sc_hd__nand2_1 _210_ (
    .A(_054_),
    .B(_070_),
    .Y(_016_)
  );
  sky130_fd_sc_hd__nand2_1 _211_ (
    .A(din0[17]),
    .B(_052_),
    .Y(_071_)
  );
  sky130_fd_sc_hd__nand2_1 _212_ (
    .A(_054_),
    .B(_071_),
    .Y(_017_)
  );
  sky130_fd_sc_hd__nand2_1 _213_ (
    .A(din0[18]),
    .B(_052_),
    .Y(_072_)
  );
  sky130_fd_sc_hd__nand2_1 _214_ (
    .A(_054_),
    .B(_072_),
    .Y(_018_)
  );
  sky130_fd_sc_hd__nand2_1 _215_ (
    .A(din0[19]),
    .B(_052_),
    .Y(_073_)
  );
  sky130_fd_sc_hd__nand2_1 _216_ (
    .A(_054_),
    .B(_073_),
    .Y(_019_)
  );
  sky130_fd_sc_hd__nand2_1 _217_ (
    .A(din0[20]),
    .B(_052_),
    .Y(_074_)
  );
  sky130_fd_sc_hd__nand2_1 _218_ (
    .A(_054_),
    .B(_074_),
    .Y(_021_)
  );
  sky130_fd_sc_hd__nand2_1 _219_ (
    .A(din0[21]),
    .B(_052_),
    .Y(_075_)
  );
  sky130_fd_sc_hd__nand2_1 _220_ (
    .A(_054_),
    .B(_075_),
    .Y(_022_)
  );
  sky130_fd_sc_hd__nand2_1 _221_ (
    .A(din0[22]),
    .B(_052_),
    .Y(_076_)
  );
  sky130_fd_sc_hd__nand2_1 _222_ (
    .A(_054_),
    .B(_076_),
    .Y(_023_)
  );
  sky130_fd_sc_hd__nand2_1 _223_ (
    .A(din0[23]),
    .B(_052_),
    .Y(_077_)
  );
  sky130_fd_sc_hd__nand2_1 _224_ (
    .A(_054_),
    .B(_077_),
    .Y(_024_)
  );
  sky130_fd_sc_hd__nand2_1 _225_ (
    .A(din0[24]),
    .B(_052_),
    .Y(_078_)
  );
  sky130_fd_sc_hd__nand2_1 _226_ (
    .A(_054_),
    .B(_078_),
    .Y(_025_)
  );
  sky130_fd_sc_hd__nand2_1 _227_ (
    .A(din0[25]),
    .B(_052_),
    .Y(_079_)
  );
  sky130_fd_sc_hd__nand2_1 _228_ (
    .A(_054_),
    .B(_079_),
    .Y(_026_)
  );
  sky130_fd_sc_hd__nand2_1 _229_ (
    .A(din0[26]),
    .B(_052_),
    .Y(_080_)
  );
  sky130_fd_sc_hd__nand2_1 _230_ (
    .A(_054_),
    .B(_080_),
    .Y(_027_)
  );
  sky130_fd_sc_hd__nand2_1 _231_ (
    .A(din0[27]),
    .B(_052_),
    .Y(_081_)
  );
  sky130_fd_sc_hd__nand2_1 _232_ (
    .A(_054_),
    .B(_081_),
    .Y(_028_)
  );
  sky130_fd_sc_hd__nand2_1 _233_ (
    .A(din0[28]),
    .B(_052_),
    .Y(_082_)
  );
  sky130_fd_sc_hd__nand2_1 _234_ (
    .A(_054_),
    .B(_082_),
    .Y(_029_)
  );
  sky130_fd_sc_hd__nand2_1 _235_ (
    .A(din0[29]),
    .B(_052_),
    .Y(_083_)
  );
  sky130_fd_sc_hd__nand2_1 _236_ (
    .A(_054_),
    .B(_083_),
    .Y(_030_)
  );
  sky130_fd_sc_hd__nand2_1 _237_ (
    .A(din0[30]),
    .B(_052_),
    .Y(_084_)
  );
  sky130_fd_sc_hd__nand2_1 _238_ (
    .A(_054_),
    .B(_084_),
    .Y(_032_)
  );
  sky130_fd_sc_hd__nand2_1 _239_ (
    .A(din0[31]),
    .B(_052_),
    .Y(_085_)
  );
  sky130_fd_sc_hd__nand2_1 _240_ (
    .A(_054_),
    .B(_085_),
    .Y(_033_)
  );
  sky130_fd_sc_hd__and3_1 _241_ (
    .A(addr_cnt[0]),
    .B(addr_cnt[1]),
    .C(addr_cnt[2]),
    .X(_086_)
  );
  sky130_fd_sc_hd__and4_1 _242_ (
    .A(addr_cnt[0]),
    .B(addr_cnt[1]),
    .C(addr_cnt[2]),
    .D(addr_cnt[3]),
    .X(_087_)
  );
  sky130_fd_sc_hd__nand2_1 _243_ (
    .A(addr_cnt[4]),
    .B(_087_),
    .Y(_088_)
  );
  sky130_fd_sc_hd__nand4_1 _244_ (
    .A(addr_cnt[4]),
    .B(addr_cnt[5]),
    .C(addr_cnt[6]),
    .D(_087_),
    .Y(_089_)
  );
  sky130_fd_sc_hd__nor2_1 _245_ (
    .A(_041_),
    .B(_089_),
    .Y(_090_)
  );
  sky130_fd_sc_hd__nor4b_1 _246_ (
    .A(_041_),
    .B(addr_cnt[9]),
    .C(_089_),
    .D_N(addr_cnt[8]),
    .Y(_091_)
  );
  sky130_fd_sc_hd__nand3_1 _247_ (
    .A(addr_cnt[8]),
    .B(_042_),
    .C(_090_),
    .Y(_092_)
  );
  sky130_fd_sc_hd__nor2_1 _248_ (
    .A(state[0]),
    .B(_091_),
    .Y(_093_)
  );
  sky130_fd_sc_hd__a21oi_1 _249_ (
    .A1(state[0]),
    .A2(_091_),
    .B1(state[2]),
    .Y(_094_)
  );
  sky130_fd_sc_hd__a22oi_1 _250_ (
    .A1(state[2]),
    .A2(_043_),
    .B1(_094_),
    .B2(state[1]),
    .Y(_095_)
  );
  sky130_fd_sc_hd__nand2_1 _251_ (
    .A(start_bist),
    .B(_044_),
    .Y(_096_)
  );
  sky130_fd_sc_hd__nand2_1 _252_ (
    .A(state[2]),
    .B(_050_),
    .Y(_097_)
  );
  sky130_fd_sc_hd__nand2_1 _253_ (
    .A(state[1]),
    .B(state[2]),
    .Y(_098_)
  );
  sky130_fd_sc_hd__nand3_1 _254_ (
    .A(state[1]),
    .B(state[0]),
    .C(state[2]),
    .Y(_099_)
  );
  sky130_fd_sc_hd__nand2_1 _255_ (
    .A(_096_),
    .B(_099_),
    .Y(_100_)
  );
  sky130_fd_sc_hd__a21oi_1 _256_ (
    .A1(_051_),
    .A2(_092_),
    .B1(_100_),
    .Y(_101_)
  );
  sky130_fd_sc_hd__o21ai_0 _257_ (
    .A1(_093_),
    .A2(_095_),
    .B1(_101_),
    .Y(_154_[0])
  );
  sky130_fd_sc_hd__a22oi_1 _258_ (
    .A1(_051_),
    .A2(_091_),
    .B1(_094_),
    .B2(state[1]),
    .Y(_102_)
  );
  sky130_fd_sc_hd__nand2_1 _259_ (
    .A(_098_),
    .B(_102_),
    .Y(_154_[1])
  );
  sky130_fd_sc_hd__nor2_1 _260_ (
    .A(_050_),
    .B(_094_),
    .Y(_154_[2])
  );
  sky130_fd_sc_hd__a21oi_1 _261_ (
    .A1(start_bist),
    .A2(_045_),
    .B1(_046_),
    .Y(_103_)
  );
  sky130_fd_sc_hd__nand2_1 _262_ (
    .A(addr_cnt[0]),
    .B(_103_),
    .Y(_104_)
  );
  sky130_fd_sc_hd__o21ai_0 _263_ (
    .A1(addr_cnt[0]),
    .A2(_047_),
    .B1(_104_),
    .Y(_155_[0])
  );
  sky130_fd_sc_hd__nand2_1 _264_ (
    .A(addr_cnt[1]),
    .B(_103_),
    .Y(_105_)
  );
  sky130_fd_sc_hd__a21oi_1 _265_ (
    .A1(addr_cnt[0]),
    .A2(addr_cnt[1]),
    .B1(_047_),
    .Y(_106_)
  );
  sky130_fd_sc_hd__o21ai_0 _266_ (
    .A1(addr_cnt[0]),
    .A2(addr_cnt[1]),
    .B1(_106_),
    .Y(_107_)
  );
  sky130_fd_sc_hd__nand2_1 _267_ (
    .A(_105_),
    .B(_107_),
    .Y(_155_[1])
  );
  sky130_fd_sc_hd__a21oi_1 _268_ (
    .A1(addr_cnt[0]),
    .A2(addr_cnt[1]),
    .B1(addr_cnt[2]),
    .Y(_108_)
  );
  sky130_fd_sc_hd__nand2_1 _269_ (
    .A(addr_cnt[2]),
    .B(_103_),
    .Y(_109_)
  );
  sky130_fd_sc_hd__o31ai_1 _270_ (
    .A1(_047_),
    .A2(_086_),
    .A3(_108_),
    .B1(_109_),
    .Y(_155_[2])
  );
  sky130_fd_sc_hd__nand2_1 _271_ (
    .A(addr_cnt[3]),
    .B(_103_),
    .Y(_110_)
  );
  sky130_fd_sc_hd__o21ai_0 _272_ (
    .A1(addr_cnt[3]),
    .A2(_086_),
    .B1(_046_),
    .Y(_111_)
  );
  sky130_fd_sc_hd__o21ai_0 _273_ (
    .A1(_087_),
    .A2(_111_),
    .B1(_110_),
    .Y(_155_[3])
  );
  sky130_fd_sc_hd__nor2_1 _274_ (
    .A(addr_cnt[4]),
    .B(_087_),
    .Y(_112_)
  );
  sky130_fd_sc_hd__a22oi_1 _275_ (
    .A1(_046_),
    .A2(_088_),
    .B1(_103_),
    .B2(addr_cnt[4]),
    .Y(_113_)
  );
  sky130_fd_sc_hd__nor2_1 _276_ (
    .A(_112_),
    .B(_113_),
    .Y(_155_[4])
  );
  sky130_fd_sc_hd__nand2_1 _277_ (
    .A(addr_cnt[5]),
    .B(_103_),
    .Y(_114_)
  );
  sky130_fd_sc_hd__xor2_1 _278_ (
    .A(addr_cnt[5]),
    .B(_088_),
    .X(_115_)
  );
  sky130_fd_sc_hd__o21ai_0 _279_ (
    .A1(_047_),
    .A2(_115_),
    .B1(_114_),
    .Y(_155_[5])
  );
  sky130_fd_sc_hd__a31oi_1 _280_ (
    .A1(addr_cnt[4]),
    .A2(addr_cnt[5]),
    .A3(_087_),
    .B1(addr_cnt[6]),
    .Y(_116_)
  );
  sky130_fd_sc_hd__a22oi_1 _281_ (
    .A1(_046_),
    .A2(_089_),
    .B1(_103_),
    .B2(addr_cnt[6]),
    .Y(_117_)
  );
  sky130_fd_sc_hd__nor2_1 _282_ (
    .A(_116_),
    .B(_117_),
    .Y(_155_[6])
  );
  sky130_fd_sc_hd__nor2_1 _283_ (
    .A(_047_),
    .B(_090_),
    .Y(_118_)
  );
  sky130_fd_sc_hd__a21oi_1 _284_ (
    .A1(addr_cnt[7]),
    .A2(_103_),
    .B1(_118_),
    .Y(_119_)
  );
  sky130_fd_sc_hd__a21oi_1 _285_ (
    .A1(_041_),
    .A2(_089_),
    .B1(_119_),
    .Y(_155_[7])
  );
  sky130_fd_sc_hd__a21oi_1 _286_ (
    .A1(addr_cnt[8]),
    .A2(_090_),
    .B1(_044_),
    .Y(_120_)
  );
  sky130_fd_sc_hd__nor2_1 _287_ (
    .A(_103_),
    .B(_120_),
    .Y(_121_)
  );
  sky130_fd_sc_hd__a21oi_1 _288_ (
    .A1(_046_),
    .A2(_090_),
    .B1(addr_cnt[8]),
    .Y(_122_)
  );
  sky130_fd_sc_hd__nor2_1 _289_ (
    .A(_121_),
    .B(_122_),
    .Y(_155_[8])
  );
  sky130_fd_sc_hd__o21ai_0 _290_ (
    .A1(state[0]),
    .A2(state[2]),
    .B1(_045_),
    .Y(_123_)
  );
  sky130_fd_sc_hd__o22ai_1 _291_ (
    .A1(_042_),
    .A2(_121_),
    .B1(_123_),
    .B2(_092_),
    .Y(_155_[9])
  );
  sky130_fd_sc_hd__nand2_1 _292_ (
    .A(web0),
    .B(_123_),
    .Y(_124_)
  );
  sky130_fd_sc_hd__nor3b_1 _293_ (
    .A(state[0]),
    .B(state[2]),
    .C_N(state[1]),
    .Y(_125_)
  );
  sky130_fd_sc_hd__a21oi_1 _294_ (
    .A1(state[2]),
    .A2(_043_),
    .B1(_125_),
    .Y(_126_)
  );
  sky130_fd_sc_hd__nand3_1 _295_ (
    .A(_097_),
    .B(_124_),
    .C(_126_),
    .Y(_156_)
  );
  sky130_fd_sc_hd__nand2_1 _296_ (
    .A(csb0),
    .B(_047_),
    .Y(_127_)
  );
  sky130_fd_sc_hd__nand2_1 _297_ (
    .A(_097_),
    .B(_127_),
    .Y(_157_)
  );
  sky130_fd_sc_hd__a21oi_1 _298_ (
    .A1(start_bist),
    .A2(_044_),
    .B1(bist_pass),
    .Y(_128_)
  );
  sky130_fd_sc_hd__nand4_1 _299_ (
    .A(dout0[28]),
    .B(dout0[29]),
    .C(dout0[30]),
    .D(dout0[31]),
    .Y(_129_)
  );
  sky130_fd_sc_hd__nand4_1 _300_ (
    .A(dout0[24]),
    .B(dout0[25]),
    .C(dout0[26]),
    .D(dout0[27]),
    .Y(_130_)
  );
  sky130_fd_sc_hd__nor2_1 _301_ (
    .A(_129_),
    .B(_130_),
    .Y(_131_)
  );
  sky130_fd_sc_hd__nand4_1 _302_ (
    .A(dout0[4]),
    .B(dout0[5]),
    .C(dout0[6]),
    .D(dout0[7]),
    .Y(_132_)
  );
  sky130_fd_sc_hd__nand4_1 _303_ (
    .A(dout0[1]),
    .B(dout0[0]),
    .C(dout0[2]),
    .D(dout0[3]),
    .Y(_133_)
  );
  sky130_fd_sc_hd__nand4_1 _304_ (
    .A(dout0[12]),
    .B(dout0[13]),
    .C(dout0[14]),
    .D(dout0[15]),
    .Y(_134_)
  );
  sky130_fd_sc_hd__nand4_1 _305_ (
    .A(dout0[8]),
    .B(dout0[9]),
    .C(dout0[10]),
    .D(dout0[11]),
    .Y(_135_)
  );
  sky130_fd_sc_hd__nand4_1 _306_ (
    .A(dout0[20]),
    .B(dout0[21]),
    .C(dout0[22]),
    .D(dout0[23]),
    .Y(_136_)
  );
  sky130_fd_sc_hd__nand4_1 _307_ (
    .A(dout0[16]),
    .B(dout0[17]),
    .C(dout0[18]),
    .D(dout0[19]),
    .Y(_137_)
  );
  sky130_fd_sc_hd__or4_1 _308_ (
    .A(_134_),
    .B(_135_),
    .C(_136_),
    .D(_137_),
    .X(_138_)
  );
  sky130_fd_sc_hd__nor3_1 _309_ (
    .A(_132_),
    .B(_133_),
    .C(_138_),
    .Y(_139_)
  );
  sky130_fd_sc_hd__nand4_1 _310_ (
    .A(state[2]),
    .B(_043_),
    .C(_131_),
    .D(_139_),
    .Y(_140_)
  );
  sky130_fd_sc_hd__nor4_1 _311_ (
    .A(dout0[28]),
    .B(dout0[29]),
    .C(dout0[30]),
    .D(dout0[31]),
    .Y(_141_)
  );
  sky130_fd_sc_hd__nor4_1 _312_ (
    .A(dout0[24]),
    .B(dout0[25]),
    .C(dout0[26]),
    .D(dout0[27]),
    .Y(_142_)
  );
  sky130_fd_sc_hd__nor4_1 _313_ (
    .A(dout0[4]),
    .B(dout0[5]),
    .C(dout0[6]),
    .D(dout0[7]),
    .Y(_143_)
  );
  sky130_fd_sc_hd__nor4_1 _314_ (
    .A(dout0[1]),
    .B(dout0[0]),
    .C(dout0[2]),
    .D(dout0[3]),
    .Y(_144_)
  );
  sky130_fd_sc_hd__nand2_1 _315_ (
    .A(_143_),
    .B(_144_),
    .Y(_145_)
  );
  sky130_fd_sc_hd__nor4_1 _316_ (
    .A(dout0[12]),
    .B(dout0[13]),
    .C(dout0[14]),
    .D(dout0[15]),
    .Y(_146_)
  );
  sky130_fd_sc_hd__nor4_1 _317_ (
    .A(dout0[8]),
    .B(dout0[9]),
    .C(dout0[10]),
    .D(dout0[11]),
    .Y(_147_)
  );
  sky130_fd_sc_hd__nor4_1 _318_ (
    .A(dout0[20]),
    .B(dout0[21]),
    .C(dout0[22]),
    .D(dout0[23]),
    .Y(_148_)
  );
  sky130_fd_sc_hd__nor4_1 _319_ (
    .A(dout0[16]),
    .B(dout0[17]),
    .C(dout0[18]),
    .D(dout0[19]),
    .Y(_149_)
  );
  sky130_fd_sc_hd__nand4_1 _320_ (
    .A(_146_),
    .B(_147_),
    .C(_148_),
    .D(_149_),
    .Y(_150_)
  );
  sky130_fd_sc_hd__nor2_1 _321_ (
    .A(_145_),
    .B(_150_),
    .Y(_151_)
  );
  sky130_fd_sc_hd__a41oi_1 _322_ (
    .A1(_125_),
    .A2(_141_),
    .A3(_142_),
    .A4(_151_),
    .B1(_126_),
    .Y(_152_)
  );
  sky130_fd_sc_hd__a21oi_1 _323_ (
    .A1(_140_),
    .A2(_152_),
    .B1(_128_),
    .Y(_158_)
  );
  sky130_fd_sc_hd__nand2_1 _324_ (
    .A(bist_done),
    .B(_096_),
    .Y(_153_)
  );
  sky130_fd_sc_hd__nand2_1 _325_ (
    .A(_097_),
    .B(_153_),
    .Y(_159_)
  );
  sky130_fd_sc_hd__mux2_1 _326_ (
    .A0(addr_cnt[0]),
    .A1(addr0[0]),
    .S(_048_),
    .X(_000_)
  );
  sky130_fd_sc_hd__mux2_1 _327_ (
    .A0(addr_cnt[1]),
    .A1(addr0[1]),
    .S(_048_),
    .X(_001_)
  );
  sky130_fd_sc_hd__mux2_1 _328_ (
    .A0(addr_cnt[2]),
    .A1(addr0[2]),
    .S(_048_),
    .X(_002_)
  );
  sky130_fd_sc_hd__mux2_1 _329_ (
    .A0(addr_cnt[3]),
    .A1(addr0[3]),
    .S(_048_),
    .X(_003_)
  );
  sky130_fd_sc_hd__mux2_1 _330_ (
    .A0(addr_cnt[4]),
    .A1(addr0[4]),
    .S(_048_),
    .X(_004_)
  );
  sky130_fd_sc_hd__dfxtp_1 _331_ (
    .CLK(clk),
    .D(_000_),
    .Q(addr0[0])
  );
  sky130_fd_sc_hd__dfxtp_1 _332_ (
    .CLK(clk),
    .D(_001_),
    .Q(addr0[1])
  );
  sky130_fd_sc_hd__dfxtp_1 _333_ (
    .CLK(clk),
    .D(_002_),
    .Q(addr0[2])
  );
  sky130_fd_sc_hd__dfxtp_1 _334_ (
    .CLK(clk),
    .D(_003_),
    .Q(addr0[3])
  );
  sky130_fd_sc_hd__dfxtp_1 _335_ (
    .CLK(clk),
    .D(_004_),
    .Q(addr0[4])
  );
  sky130_fd_sc_hd__dfxtp_1 _336_ (
    .CLK(clk),
    .D(_005_),
    .Q(addr0[5])
  );
  sky130_fd_sc_hd__dfxtp_1 _337_ (
    .CLK(clk),
    .D(_006_),
    .Q(addr0[6])
  );
  sky130_fd_sc_hd__dfxtp_1 _338_ (
    .CLK(clk),
    .D(_007_),
    .Q(addr0[7])
  );
  sky130_fd_sc_hd__dfxtp_1 _339_ (
    .CLK(clk),
    .D(_008_),
    .Q(addr0[8])
  );
  sky130_fd_sc_hd__dfxtp_1 _340_ (
    .CLK(clk),
    .D(_009_),
    .Q(din0[0])
  );
  sky130_fd_sc_hd__dfxtp_1 _341_ (
    .CLK(clk),
    .D(_020_),
    .Q(din0[1])
  );
  sky130_fd_sc_hd__dfxtp_1 _342_ (
    .CLK(clk),
    .D(_031_),
    .Q(din0[2])
  );
  sky130_fd_sc_hd__dfxtp_1 _343_ (
    .CLK(clk),
    .D(_034_),
    .Q(din0[3])
  );
  sky130_fd_sc_hd__dfxtp_1 _344_ (
    .CLK(clk),
    .D(_035_),
    .Q(din0[4])
  );
  sky130_fd_sc_hd__dfxtp_1 _345_ (
    .CLK(clk),
    .D(_036_),
    .Q(din0[5])
  );
  sky130_fd_sc_hd__dfxtp_1 _346_ (
    .CLK(clk),
    .D(_037_),
    .Q(din0[6])
  );
  sky130_fd_sc_hd__dfxtp_1 _347_ (
    .CLK(clk),
    .D(_038_),
    .Q(din0[7])
  );
  sky130_fd_sc_hd__dfxtp_1 _348_ (
    .CLK(clk),
    .D(_039_),
    .Q(din0[8])
  );
  sky130_fd_sc_hd__dfxtp_1 _349_ (
    .CLK(clk),
    .D(_040_),
    .Q(din0[9])
  );
  sky130_fd_sc_hd__dfxtp_1 _350_ (
    .CLK(clk),
    .D(_010_),
    .Q(din0[10])
  );
  sky130_fd_sc_hd__dfxtp_1 _351_ (
    .CLK(clk),
    .D(_011_),
    .Q(din0[11])
  );
  sky130_fd_sc_hd__dfxtp_1 _352_ (
    .CLK(clk),
    .D(_012_),
    .Q(din0[12])
  );
  sky130_fd_sc_hd__dfxtp_1 _353_ (
    .CLK(clk),
    .D(_013_),
    .Q(din0[13])
  );
  sky130_fd_sc_hd__dfxtp_1 _354_ (
    .CLK(clk),
    .D(_014_),
    .Q(din0[14])
  );
  sky130_fd_sc_hd__dfxtp_1 _355_ (
    .CLK(clk),
    .D(_015_),
    .Q(din0[15])
  );
  sky130_fd_sc_hd__dfxtp_1 _356_ (
    .CLK(clk),
    .D(_016_),
    .Q(din0[16])
  );
  sky130_fd_sc_hd__dfxtp_1 _357_ (
    .CLK(clk),
    .D(_017_),
    .Q(din0[17])
  );
  sky130_fd_sc_hd__dfxtp_1 _358_ (
    .CLK(clk),
    .D(_018_),
    .Q(din0[18])
  );
  sky130_fd_sc_hd__dfxtp_1 _359_ (
    .CLK(clk),
    .D(_019_),
    .Q(din0[19])
  );
  sky130_fd_sc_hd__dfxtp_1 _360_ (
    .CLK(clk),
    .D(_021_),
    .Q(din0[20])
  );
  sky130_fd_sc_hd__dfxtp_1 _361_ (
    .CLK(clk),
    .D(_022_),
    .Q(din0[21])
  );
  sky130_fd_sc_hd__dfxtp_1 _362_ (
    .CLK(clk),
    .D(_023_),
    .Q(din0[22])
  );
  sky130_fd_sc_hd__dfxtp_1 _363_ (
    .CLK(clk),
    .D(_024_),
    .Q(din0[23])
  );
  sky130_fd_sc_hd__dfxtp_1 _364_ (
    .CLK(clk),
    .D(_025_),
    .Q(din0[24])
  );
  sky130_fd_sc_hd__dfxtp_1 _365_ (
    .CLK(clk),
    .D(_026_),
    .Q(din0[25])
  );
  sky130_fd_sc_hd__dfxtp_1 _366_ (
    .CLK(clk),
    .D(_027_),
    .Q(din0[26])
  );
  sky130_fd_sc_hd__dfxtp_1 _367_ (
    .CLK(clk),
    .D(_028_),
    .Q(din0[27])
  );
  sky130_fd_sc_hd__dfxtp_1 _368_ (
    .CLK(clk),
    .D(_029_),
    .Q(din0[28])
  );
  sky130_fd_sc_hd__dfxtp_1 _369_ (
    .CLK(clk),
    .D(_030_),
    .Q(din0[29])
  );
  sky130_fd_sc_hd__dfxtp_1 _370_ (
    .CLK(clk),
    .D(_032_),
    .Q(din0[30])
  );
  sky130_fd_sc_hd__dfxtp_1 _371_ (
    .CLK(clk),
    .D(_033_),
    .Q(din0[31])
  );
  sky130_fd_sc_hd__dfrtp_1 _372_ (
    .CLK(clk),
    .D(_155_[0]),
    .Q(addr_cnt[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _373_ (
    .CLK(clk),
    .D(_155_[1]),
    .Q(addr_cnt[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _374_ (
    .CLK(clk),
    .D(_155_[2]),
    .Q(addr_cnt[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _375_ (
    .CLK(clk),
    .D(_155_[3]),
    .Q(addr_cnt[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _376_ (
    .CLK(clk),
    .D(_155_[4]),
    .Q(addr_cnt[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _377_ (
    .CLK(clk),
    .D(_155_[5]),
    .Q(addr_cnt[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _378_ (
    .CLK(clk),
    .D(_155_[6]),
    .Q(addr_cnt[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _379_ (
    .CLK(clk),
    .D(_155_[7]),
    .Q(addr_cnt[7]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _380_ (
    .CLK(clk),
    .D(_155_[8]),
    .Q(addr_cnt[8]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _381_ (
    .CLK(clk),
    .D(_155_[9]),
    .Q(addr_cnt[9]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _382_ (
    .CLK(clk),
    .D(_154_[0]),
    .Q(state[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _383_ (
    .CLK(clk),
    .D(_154_[1]),
    .Q(state[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _384_ (
    .CLK(clk),
    .D(_154_[2]),
    .Q(state[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_1 _385_ (
    .CLK(clk),
    .D(_159_),
    .Q(bist_done),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _386_ (
    .CLK(clk),
    .D(_158_),
    .Q(bist_pass),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _387_ (
    .CLK(clk),
    .D(_157_),
    .Q(csb0),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _388_ (
    .CLK(clk),
    .D(_156_),
    .Q(web0),
    .SET_B(rst_n)
  );
endmodule
