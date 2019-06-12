function qrySkillEnable(sk)
   local ske = skillsEnable[sk]
   -- ain debug
   if not ske then
      return false
   end
   local skl = {}
   if type(ske) == "function" then
      if ske() then
         skl = utils.split(ske(), ",")
      else
         return false
      end
   else
      skl = utils.split(ske, ",")
   end
   local skr = {}
   for _, p in pairs(skl) do
      skr[p] = true
   end
   if countTab(skr) > 0 then
      return skr
   else
      return false
   end
end

skillEnable = {
   ["anying-fuxiang"] = "dodge",
   ["anran-zhang"] = "strike",
   ["bahuang-gong"] = "force",
   ["baihua-cuoquan"] = "cuff",
   ["banruo-zhang"] = "strike",
   ["beiming-shengong"] = "force",
   ["bihai-chaosheng"] = "force",
   ["canglang-goufa"] = "hook",
   ["canhe-zhi"] = "finger",
   ["caoshang-fei"] = "dodge",
   ["chongling-jian"] = "sword",
   ["chousui-zhang"] = "strike",
   ["chuanyun-tui"] = "leg",
   ["cihang-bian"] = "whip",
   ["cibei-dao"] = "blade",
   ["cuixin-zhang"] = "strike",
   ["cuogu-shou"] = "hand",
   ["dafumo-quan"] = "cuff",
   ["dagou-bang"] = "stick",
   ["damo-jian"] = "sword",
   ["qianzhu-wandushou"] = "hand",
   ["dashou-yin"] = "hand",
   ["ding-dodge"] = "dodge",
   ["duanjia-jianfa"] = "sword",
   ["duanjia-quan"] = "cuff",
   ["dugu-jiujian"] = "sword",
   ["dulong-dafa"] = "force",
   ["duoming-jinhua"] = "throwing",
   ["fanliangyi-dao"] = "blade",
   ["fengmo-zhang"] = "staff",
   ["fengyun-shou"] = "hand",
   ["fuhu-quan"] = "cuff",
   ["fumo-jian"] = "sword",
   ["fuqin-shi"] = "whip",
   ["furong-jinzhen"] = "throwing",
   ["guiyuan-tunafa"] = "force",
   ["hamabu"] = "dodge",
   ["hamagong"] = "force",
   ["hanbing-mianzhang"] = "strike",
   ["hanbing-shenzhang"] = "strike",
   ["hanbing-zhenqi"] = "force",
   ["haotian-zhang"] = "strike",
   ["hansha-sheying"] = "throwing",
   ["hengshan-jian"] = "sword",
   ["hengshan-jianfa"] = "sword",
   ["henshan-jianfa"] = "sword",
   ["huagong-dafa"] = "force",
   ["huagu-mianzhang"] = "strike",
   ["huanmo-wubu"] = "dodge",
   ["huanmo-longtianwu"] = "dodge",
   ["huanyin-zhi"] = "finger",
   ["huashan-jianfa"] = "sword",
   ["huashan-qigong"] = "force",
   ["huashan-shenfa"] = "dodge",
   ["huifeng-bian"] = "whip",
   ["huifeng-jian"] = "sword",
   ["hujia-daofa"] = "blade",
   ["huntian-qigong"] = "force",
   ["hunyuan-zhang"] = "strike",
   ["huoyan-dao"] = "strike",
   ["huyan-qiang"] = "spear",
   ["jieshou-jiushi"] = "hand",
   ["jimie-zhua"] = "claw",
   ["jindao-heijian"] = "sword",
   ["jingang-quan"] = "cuff",
   ["jinshe-jianfa"] = "sword",
   ["jinshe-zhangfa"] = "strike",
   ["jinshe-zhuifa"] = "throwing",
   ["jinwu-daofa"] = "blade",
   ["jinyan-gong"] = "dodge",
   ["jiuyang-shengong"] = "force",
   ["jiuyin-baiguzhua"] = "claw",
   ["jiuyin-shenfa"] = "dodge",
   ["jiuyin-shenzhang"] = "strike",
   ["jiuyin-shenzhua"] = "claw",
   ["jiuyin-zhengong"] = "force",
   ["juehu-shou"] = "hand",
   ["kaishan-fu"] = "axe",
   ["kaishan-zhang"] = "strike",
   ["kongming-quan"] = "cuff",
   ["kuaihuo-zhang"] = "strike",
   ["kuihua-feiying"] = "dodge",
   ["kuihua-mogong"] = "force",
   ["kuihua-shengong"] = "force",
   ["kunlun-zhang"] = "strike",
   ["kurong-changong"] = "force",
   ["lanhua-shou"] = "hand",
   ["lengquan-shengong"] = "force",
   ["liangyi-jian"] = "sword",
   ["lianhua-zhang"] = "strike",
   ["lietian-fu"] = "axe",
   ["liehuo-jian"] = "sword",
   ["lieyan-dao"] = "blade",
   ["lingbo-weibu"] = "dodge",
   ["lingshe-bianfa"] = "whip",
   ["lingshe-quanfa"] = "cuff",
   ["lingxu-bu"] = "dodge",
   ["linji-zhuang"] = "force",
   ["liuhe-daofa"] = "blade",
   ["liuyang-zhang"] = "strike",
   ["liuye-daofa"] = "blade",
   ["longxiang-boruo"] = "force",
   ["longzhua-gong"] = "claw",
   ["luohan-quan"] = "cuff",
   ["luoying-zhang"] = "strike",
   ["mantian-huayu"] = "throwing",
   ["meinu-quanfa"] = "cuff",
   ["miaojia-jianfa"] = "sword",
   ["murong-daofa"] = "blade",
   ["murong-jianfa"] = "sword",
   ["nianhua-zhi"] = "finger",
   ["ningxue-shenzhao"] = "claw",
   ["ningxue-shenzhua"] = "claw",
   ["pangen-fu"] = "axe",
   ["pixie-jian"] = "sword",
   ["piaomiao-shenfa"] = "dodge",
   ["piaoyi-bu"] = "dodge",
   ["piaoyi-shenfa"] = "dodge",
   ["pinxu-lingfeng"] = "dodge",
   ["pomopima-jian"] = "sword",
   ["poyu-quan"] = "cuff",
   ["qiantian-yiyang"] = "force",
   ["qianye-shou"] = "hand",
   ["qianzhu-wandushou"] = "hand",
   ["qingyan-zhang"] = "strike",
   ["qishang-quan"] = "cuff",
   ["qixian-wuxingjian"] = "sword",
   ["quanzhen-jianfa"] = "sword",
   ["ranmu-daofa"] = "blade",
   ["riyue-bian"] = "whip",
   ["ruyi-dao"] = "blade",
   ["ruying-suixingtui"] = "leg",
   ["sanhua-zhang"] = "strike",
   ["sanyin-zhua"] = "claw",
   ["shaolin-shenfa"] = "dodge",
   ["shaolin-tantui"] = "leg",
   ["shenghuo-lingfa"] = "dagger",
   ["shenghuo-shengong"] = "force",
   ["shenlong-tuifa"] = "leg",
   ["shenxing-baibian"] = "dodge",
   ["shenyuan-gong"] = "force",
   ["shenzhao-jing"] = "force",
   ["shexing-diaoshou"] = "hand",
   ["shuishangpiao"] = "dodge",
   ["sixiang-zhang"] = "strike",
   ["songshan-jian"] = "sword",
   ["songshan-qigong"] = "force",
   ["songyang-bian"] = "whip",
   ["songyang-shou"] = "hand",
   ["songyang-zhang"] = "strike",
   ["suibo-zhuliu"] = "dodge",
   ["suohou-shou"] = "hand",
   ["taiji-jian"] = "sword",
   ["taiji-quan"] = "cuff",
   ["taiji-shengong"] = "force",
   ["taishan-jianfa"] = "sword",
   ["taixuan-gong"] = "strike",
   ["taizu-quan"] = "cuff",
   ["tangshi-jianfa"] = "sword",
   ["tanzhi-shentong"] = "finger",
   --["tanzhi-shentong"] = "throwing",
   ["taxue-wuhen"] = "dodge",
   ["tenglong-bifa"] = "dagger",
   ["tianmo-dao"] = "blade",
   ["tianmo-gong"] = "force",
   ["tianmo-jian"] = "sword",
   ["tianmo-shou"] = "hand",
   ["tianmo-zhang"] = "strike",
   ["tiangang-zhang"] = "strike",
   ["tianlong-xiang"] = "dodge",
   ["tianshan-zhang"] = "staff",
   ["tianwang-zhua"] = "claw",
   ["tianyu-qijian"] = "sword",
   ["tiezhang-zhangfa"] = "strike",
   ["tiyunzong"] = "dodge",
   ["weituo-chu"] = "club",
   ["wudang-mianzhang"] = "strike",
   ["wudu-yanluobu"] = "dodge",
   ["wuhu-duanmendao"] = "blade",
   ["wuxiang-zhi"] = "finger",
   ["wuyue-jianfa"] = "sword",
   ["xiangfu-lun"] = "hammer",
   ["xianglong-zhang"] = "strike",
   ["xiangmo-chu"] = "hammer",
   ["xiantian-gong"] = "force",
   ["xiaohun-zhang"] = "strike",
   ["xiaoyaoyou"] = "dodge",
   ["xiaoyao-jian"] = "sword",
   ["xingyi-zhang"] = "strike",
   ["xiuluo-dao"] = "blade",
   ["xixing-dafa"] = "force",
   ["xuanfeng-tui"] = "leg",
   ["xuangong-quan"] = "cuff",
   ["xuanming-shenzhang"] = "strike",
   ["xuantian-wuji"] = "force",
   ["xuantian-zhi"] = "finger",
   ["xuantie-jianfa"] = "sword",
   ["xuanxu-daofa"] = "blade",
   ["xuanyin-jian"] = "sword",
   ["xuedao-jing"] = "blade",
   ["xunlei-jian"] = "sword",
   ["yangjia-qiang"] = "spear",
   ["yanling-shenfa"] = "dodge",
   ["yanxing-daofa"] = "blade",
   ["yijin-jing"] = "force",
   --["yingou-bifa"] = "brush",
   ["yinlong-bian"] = "whip",
   ["yingshe-shengsibo"] = "claw",
   ["yinsuo-jinling"] = "whip",
   ["yitian-tulong"] = "sword",
   ["yiyang-zhi"] = "finger",
   ["yizhi-chan"] = "finger",
   ["yinyun-ziqi"] = "force",
   ["youlong-bian"] = "whip",
   ["youlong-shenfa"] = "dodge",
   ["youming-zhao"] = "claw",
   ["yuenu-jian"] = "sword",
   ["yueying-wubu"] = "dodge",
   ["yunu-jianfa"] = "sword",
   ["yunu-xinjing"] = "force",
   ["yunu-shenfa"] = "dodge",
   ["yuxiao-jian"] = "sword",
   ["yuxue-dunxing"] = "dodge",
   ["zhaixingshu"] = "dodge",
   ["zhemei-shou"] = "hand",
   ["zhenshan-mianzhang"] = "strike",
   ["zhentian-quan"] = "cuff",
   ["zhong-qiang"] = "spear",
   ["zhongyuefeng"] = "dodge",
   ["zhuihun-gou"] = "hook",
   ["zhusha-zhang"] = "strike",
   ["zixia-gong"] = "force",
   ["zuibaxian"] = "dodge",
   ["zui-gun"] = "club",
   ["tianmo-gun"] = "club",
   ["qixian-wuxingjian"] = "sword"
}

skillsEnable = {
   ["anying-fuxiang"] = "dodge",
   ["anran-zhang"] = "strike",
   ["bahuang-gong"] = "force",
   ["baihua-cuoquan"] = "cuff",
   ["banruo-zhang"] = "strike",
   ["beiming-shengong"] = "force",
   ["bihai-chaosheng"] = "force",
   ["canglang-goufa"] = "hook",
   ["canhe-zhi"] = "finger",
   ["caoshang-fei"] = "dodge",
   ["chongling-jian"] = "sword",
   ["chousui-zhang"] = "strike",
   ["chuanyun-tui"] = "leg",
   ["cihang-bian"] = "whip",
   ["cibei-dao"] = "blade",
   ["cuixin-zhang"] = "strike",
   ["cuogu-shou"] = "hand",
   ["dafumo-quan"] = "cuff",
   ["dagou-bang"] = "stick",
   ["damo-jian"] = "sword",
   ["qianzhu-wandushou"] = "hand",
   ["dashou-yin"] = "hand",
   ["ding-dodge"] = "dodge",
   ["duanjia-jianfa"] = "sword",
   ["duanjia-quan"] = "cuff",
   ["dugu-jiujian"] = "sword",
   ["dulong-dafa"] = "force",
   ["duoming-jinhua"] = "throwing",
   ["fanliangyi-dao"] = "blade",
   ["fengmo-zhang"] = "staff",
   ["fengyun-shou"] = "hand",
   ["fuhu-quan"] = "cuff",
   ["fumo-jian"] = "sword",
   ["fuqin-shi"] = "whip",
   ["furong-jinzhen"] = "throwing",
   ["guiyuan-tunafa"] = "force",
   ["hamabu"] = "dodge",
   ["hamagong"] = "force",
   ["hanbing-mianzhang"] = "strike",
   ["hanbing-shenzhang"] = "strike",
   ["hanbing-zhenqi"] = "force",
   ["haotian-zhang"] = "strike",
   ["hansha-sheying"] = "throwing",
   ["hengshan-jian"] = "sword",
   ["hengshan-jianfa"] = "sword",
   ["henshan-jianfa"] = "sword",
   ["huagong-dafa"] = "force",
   ["huagu-mianzhang"] = "strike",
   ["huanmo-wubu"] = "dodge",
   ["huanmo-longtianwu"] = "dodge",
   ["huanyin-zhi"] = "finger",
   ["huashan-jianfa"] = "sword",
   ["huashan-qigong"] = "force",
   ["huashan-shenfa"] = "dodge",
   ["huifeng-bian"] = "whip",
   ["huifeng-jian"] = "sword",
   ["hujia-daofa"] = "blade",
   ["huntian-qigong"] = "force",
   ["hunyuan-zhang"] = "strike",
   ["huoyan-dao"] = "strike",
   ["huyan-qiang"] = "spear",
   ["jieshou-jiushi"] = "hand",
   ["jimie-zhua"] = "claw",
   ["jindao-heijian"] = "sword",
   ["jingang-quan"] = "cuff",
   ["jinshe-jianfa"] = "sword",
   ["jinshe-zhangfa"] = "strike",
   ["jinshe-zhuifa"] = "throwing",
   ["jinwu-daofa"] = "blade",
   ["jinyan-gong"] = "dodge",
   ["jiuyang-shengong"] = "force",
   ["jiuyin-baiguzhua"] = "claw",
   ["jiuyin-shenfa"] = "dodge",
   ["jiuyin-shenzhang"] = "strike",
   ["jiuyin-shenzhua"] = "claw",
   ["jiuyin-zhengong"] = "force",
   ["juehu-shou"] = "hand",
   ["kaishan-fu"] = "axe",
   ["kaishan-zhang"] = "strike",
   ["kongming-quan"] = "cuff",
   ["kuaihuo-zhang"] = "strike",
   ["kuihua-feiying"] = "dodge",
   ["kuihua-mogong"] = "force",
   ["kuihua-shengong"] = "force",
   ["kunlun-zhang"] = "strike",
   ["kurong-changong"] = "force",
   ["lanhua-shou"] = "hand",
   ["lengquan-shengong"] = "force",
   ["liangyi-jian"] = "sword",
   ["lianhua-zhang"] = "strike",
   ["lietian-fu"] = "axe",
   ["liehuo-jian"] = "sword",
   ["lieyan-dao"] = "blade",
   ["lingbo-weibu"] = "dodge",
   ["lingshe-bianfa"] = "whip",
   ["lingshe-quanfa"] = "cuff",
   ["lingxu-bu"] = "dodge",
   ["linji-zhuang"] = "force",
   ["liuhe-daofa"] = "blade",
   ["liuyang-zhang"] = "strike",
   ["liuye-daofa"] = "blade",
   ["longxiang-boruo"] = "force",
   ["longzhua-gong"] = "claw",
   ["luohan-quan"] = "cuff",
   ["luoying-zhang"] = "strike",
   ["mantian-huayu"] = "throwing",
   ["meinu-quanfa"] = "cuff",
   ["miaojia-jianfa"] = "sword",
   ["murong-daofa"] = "blade",
   ["murong-jianfa"] = "sword",
   ["nianhua-zhi"] = "finger",
   ["ningxue-shenzhao"] = "claw",
   ["ningxue-shenzhua"] = "claw",
   ["pangen-fu"] = "axe",
   ["pixie-jian"] = "sword",
   ["piaomiao-shenfa"] = "dodge",
   ["piaoyi-bu"] = "dodge",
   ["piaoyi-shenfa"] = "dodge",
   ["pinxu-lingfeng"] = "dodge",
   ["pomopima-jian"] = "sword",
   ["poyu-quan"] = "cuff",
   ["qiantian-yiyang"] = "force",
   ["qianye-shou"] = "hand",
   ["qianzhu-wandushou"] = "hand",
   ["qingyan-zhang"] = "strike",
   ["qishang-quan"] = "cuff",
   ["quanzhen-jianfa"] = "sword",
   ["ranmu-daofa"] = "blade",
   ["riyue-bian"] = "whip",
   ["ruyi-dao"] = "blade",
   ["ruying-suixingtui"] = "leg",
   ["sanhua-zhang"] = "strike",
   ["sanyin-zhua"] = "claw",
   ["shaolin-shenfa"] = "dodge",
   ["shaolin-tantui"] = "leg",
   ["shenghuo-lingfa"] = "dagger",
   ["shenghuo-shengong"] = "force",
   ["shenlong-tuifa"] = "leg",
   ["shenxing-baibian"] = "dodge",
   ["shenyuan-gong"] = "force",
   ["shenzhao-jing"] = "force",
   ["shexing-diaoshou"] = "hand",
   ["shuishangpiao"] = "dodge",
   ["sixiang-zhang"] = "strike",
   ["songshan-jian"] = "sword",
   ["songshan-qigong"] = "force",
   ["songyang-bian"] = "whip",
   ["songyang-shou"] = "hand",
   ["songyang-zhang"] = "strike",
   ["suibo-zhuliu"] = "dodge",
   ["suohou-shou"] = "hand",
   ["taiji-jian"] = "sword",
   ["taiji-quan"] = "cuff",
   ["taiji-shengong"] = "force",
   ["taishan-jianfa"] = "sword",
   ["taixuan-gong"] = "strike",
   ["taizu-quan"] = "cuff",
   ["tangshi-jianfa"] = "sword",
   ["tanzhi-shentong"] = "finger,throwing",
   ["taxue-wuhen"] = "dodge",
   ["tenglong-bifa"] = "dagger",
   ["tianmo-dao"] = "blade",
   ["tianmo-gong"] = "force",
   ["tianmo-jian"] = "sword",
   ["tianmo-shou"] = "hand",
   ["tianmo-zhang"] = "strike",
   ["tiangang-zhang"] = "strike",
   ["tianlong-xiang"] = "dodge",
   ["tianluo-diwang"] = "hand",
   ["tianshan-zhang"] = "staff",
   ["tianwang-zhua"] = "claw",
   ["tianyu-qijian"] = "sword",
   ["tiezhang-zhangfa"] = "strike",
   ["tiyunzong"] = "dodge",
   ["weituo-chu"] = "club",
   ["wudang-mianzhang"] = "strike",
   ["wudu-yanluobu"] = "dodge",
   ["wuhu-duanmendao"] = "blade",
   ["wuxiang-zhi"] = "finger",
   ["wuyue-jianfa"] = "sword",
   ["xiangfu-lun"] = "hammer",
   ["xianglong-zhang"] = "strike",
   ["xiangmo-chu"] = "hammer",
   ["xiantian-gong"] = "force",
   ["xiaohun-zhang"] = "strike",
   ["xiaoyaoyou"] = "dodge",
   ["xiaoyao-jian"] = "sword",
   ["xingyi-zhang"] = "strike",
   ["xiuluo-dao"] = "blade",
   ["xixing-dafa"] = "force",
   ["xuanfeng-tui"] = "leg",
   ["xuangong-quan"] = "cuff",
   ["xuanming-shenzhang"] = "strike",
   ["xuantian-wuji"] = "force",
   ["xuantian-zhi"] = "finger",
   ["xuantie-jianfa"] = "sword",
   ["xuanxu-daofa"] = "blade",
   ["xuanyin-jian"] = "sword",
   ["xuedao-jing"] = "blade",
   ["xunlei-jian"] = "sword",
   ["yangjia-qiang"] = "spear",
   ["yanling-shenfa"] = "dodge",
   ["yanxing-daofa"] = "blade",
   ["yijin-jing"] = "force",
   --["yingou-bifa"] = "brush",
   ["yinlong-bian"] = "whip",
   ["yingshe-shengsibo"] = "claw,hand",
   ["yinsuo-jinling"] = "whip",
   ["yitian-tulong"] = "sword",
   ["yiyang-zhi"] = "finger",
   ["yizhi-chan"] = "finger",
   ["yinyun-ziqi"] = "force",
   ["youlong-bian"] = "whip",
   ["youlong-shenfa"] = "dodge",
   ["youming-zhao"] = "claw",
   ["yuenu-jian"] = "sword",
   ["yueying-wubu"] = "dodge",
   ["yunu-jianfa"] = "sword",
   ["yunu-xinjing"] = "force",
   ["yunu-shenfa"] = "dodge",
   ["yuxiao-jian"] = "sword",
   ["yuxue-dunxing"] = "dodge",
   ["zhaixingshu"] = "dodge",
   ["zhemei-shou"] = "hand",
   ["zhenshan-mianzhang"] = "strike",
   ["zhentian-quan"] = "cuff",
   ["zhong-qiang"] = "spear",
   ["zhongyuefeng"] = "dodge",
   ["zhuihun-gou"] = "hook",
   ["zhusha-zhang"] = "strike",
   ["zixia-gong"] = "force",
   ["zuibaxian"] = "dodge",
   ["zui-gun"] = "club",
   ["qixian-wuxingjian"] = "sword",
   ["tianmo-gun"] = "club"
}

skillHubei = {
   ["longzhua-gong"] = "yizhi-chan",
   ["yizhi-chan"] = "longzhua-gong",
   ["jingang-quan"] = "banruo-zhang",
   ["banruo-zhang"] = "jingan-quan",
   ["ruiying-suixingtui"] = "qianye-shou",
   ["qianye-shou"] = "ruying-suixingtui",
   ["sanhua-zhang"] = "nianhua-zhi",
   ["nianhua-zhi"] = "sanhua-zhang",
   ["xuanfeng-tui"] = "luoying-zhang",
   ["luoying-zhang"] = "xuanfeng-tui",
   ["wuxiang-zhi"] = "luohan-quan",
   ["luohan-quan"] = "wuxiang-zhi"
}

skillPfm = {}

masterRoom = {
   --������
   ["������ɮ"] = "��ɽ��������",
   ["����"] = "��ɽ���ֽ�շ�ħȦ",
   ["�ɽ�"] = "��ɽ���ֽ�շ�ħȦ",
   ["�ɶ�"] = "��ɽ���ֽ�շ�ħȦ",
   --�һ���
   ["½�˷�"] = "����ׯ�鷿",
   ["½��Ӣ"] = "����ׯǰ��",
   ["��ҩʦ"] = "�һ�������ͤ",
   --��ɽ��
   ["����Ⱥ"] = "��ɽ������",
   ["������"] = "��ɽ������",
   ["������"] = "��ɽʯ��",
   --["�ⲻƽ"]   = "��ɽɽ��",
   --["�Ӳ���"]   = "��ɽɽ��",
   --["�ɲ���"]   = "��ɽɽ��",

   --�䵱��
   ["�������"] = "�䵱ɽ�����",
   ["�����"] = "�䵱ɽ������",
   ["Ī����"] = "�䵱ɽ�������칬",
   ["��Զ��"] = "�䵱ɽ�����",
   ["������"] = "�䵱ɽ��ɽСԺ",
   ["������"] = "�䵱ɽС��"
}

pker = {}
pker.name = "none"
pker.id = "none"
--create_triggerex_lvl('job_exp9',"^(> )*�����顿(\\D*)\\((\\D*)\\)��gblu start",'','gbluTeamStart',95)

--�������Ҫ��%x~((%w)~)�����ಫ������Ҳ���������һ�� kill ָ�
function Openfpk()
   EnableTriggerGroup("pk", false)
   DeleteTriggerGroup("pk")
   create_trigger_t("pk1", "^(> )*�����Ҫ��(\\D*)\\((\\D*)\\)�����ಫ��", "", "fpk")
   --	create_triggerex_lvl('pk1',"^(> )*�����Ҫ��(\\D*)\\((\\D*)\\)�����ಫ��",'','fpk',95)
   SetTriggerOption("pk1", "group", "pk")
   --EnableTriggerGroup("pk",true)
   print("fpk load finish")
   return exe("wink")
end

function fpk(n, l, w)
   local tl = GetTriggerList()
   if tl then
      for k, v in ipairs(tl) do
         EnableTrigger(v, false)
      end
   end
   delete_all_timers()
   pker.name = "none"
   pker.id = "none"
   pker.name = w[2]
   pker.id = string.lower(w[3])
   local pkername = pker.name
   locate()
   --print(locl.area..' '..locl.room)
   EnableTriggerGroup("pka", false)
   --DeleteTriggerGroup("pk2")
   --EnableTriggerGroup("pk3",false)
   --EnableTriggerGroup("pk4",false)
   --DeleteTriggerGroup("pk2")
   --DeleteTriggerGroup("pk3")
   DeleteTriggerGroup("pka")

   create_trigger_t("pkc", "^(> )*���(\\D*)һ���棬������˵�ʹ�������", "", "fpk2")
   --	create_triggerex_lvl('pk1',"^(> )*(���(\\D*)һ���棬������˵�ʹ�������|"..pker.name.."�ȵ������㣬���ǵ��ʻ�û���꣬���У���|"..pker.name.."һ��Ƴ���㣬���ߡ���һ�����˹�����|"..pker.name.."һ�����㣬���һ㶣���У����������㣡��|"..pker.name.."���������������ۺ죬���̴���������|��ȵ�����"..pker.name.."�����У���|"..pker.name.."��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��|"..pker.name.."��ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�)",'','fpk2',95)
   create_trigger_t("pk2", "^(> )*" .. pker.name .. "�ȵ������㣬���ǵ��ʻ�û���꣬���У���", "", "fpk2")
   create_trigger_t("pk3", "^(> )*" .. pker.name .. "һ��Ƴ���㣬���ߡ���һ�����˹�����", "", "fpk2")
   create_trigger_t("pk4", "^(> )*" .. pker.name .. "һ�����㣬���һ㶣���У����������㣡��", "", "fpk2")
   create_trigger_t("pk5", "^(> )*" .. pker.name .. "���������������ۺ죬���̴���������", "", "fpk2")
   create_trigger_t("pk6", "^(> )*��ȵ�����" .. pker.name .. "�����У���", "", "fpk2")
   create_trigger_t("pk7", "^(> )*" .. pker.name .. "��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��", "", "fpk3")
   create_trigger_t("pk8", "^(> )*" .. pker.name .. "��ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�", "", "fpk4")
   create_trigger_t("pkz", "^(> )*�㡸ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�", "", "fpk4")

   SetTriggerOption("pkc", "group", "pka")
   SetTriggerOption("pk2", "group", "pka")
   SetTriggerOption("pk3", "group", "pka")
   SetTriggerOption("pk4", "group", "pka")
   SetTriggerOption("pk5", "group", "pka")
   SetTriggerOption("pk6", "group", "pka")
   SetTriggerOption("pk7", "group", "pka")
   SetTriggerOption("pk8", "group", "pka")
   SetTriggerOption("pkz", "group", "pka")

   if GetVariable("pkpfm") then
      perform.pre = GetVariable("pkpfm")
   end

   local l_pfm = perform.pre

   l_pfm = perform.pre
   -- if perform and perform.skill and perform.pre then
   if perform.pre then
      create_alias("pkset", "pkset", "alias pkpfm " .. l_pfm)
      exe("pkset")
   end
   exe("set wimpy 100;yield no")
   exe("set wimpycmd pkpfm\\hp")

   logfile = GetInfo(57) .. "log/pk_fpk_" .. score.id .. " VS " .. pker.id .. "_" .. os.time() .. ".txt"
   OpenLog(logfile, false)
   print("��ʼ��¼log��", logfile)
   locate()
   exe("chat ����pk�ң�pker:" .. pker.name .. pker.id .. "��" .. locl.area .. " " .. locl.room)
   exe("pkpfm")
   exe("kill " .. pker.id)
   --  exe('pfmpfm')
   --	return exe('kill '..pker.id)
end
function fpk2()
   --��ͻ���ħ��һ���棬������˵�ʹ���������
   --	EnableTriggerGroup("pk3",false)
   --	EnableTriggerGroup("pk4",false)
   --	DeleteTriggerGroup("pk3")
   --	DeleteTriggerGroup("pk4")
   --	create_trigger_t('pk7',"^(> )*"..pker.name.."��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��",'','fpk3')
   --	create_trigger_t('pk8',"^(> )*"..pker.name.."��ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�",'','fpk4')
   --  SetTriggerOption("pk7","group","pk3")
   --  SetTriggerOption("pk8","group","pk4")
   exe("chat ע����pker��������:" .. pker.name .. pker.id .. "��" .. locl.area .. " " .. locl.room)
   return exe("kill " .. pker.id)
end
function fpk3()
   --��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ
   --	EnableTriggerGroup("pk3",false)
   --	EnableTriggerGroup("pk4",false)
   --	DeleteTriggerGroup("pk3")
   --	DeleteTriggerGroup("pk4")
   --	create_trigger_t('pk7',"^(> )*"..pker.name.."��־�Ժ�������һ�����ȣ����ڵ��ϻ��˹�ȥ��",'','fpk3')
   --	create_trigger_t('pk8',"^(> )*"..pker.name.."��ž����һ�����ڵ��ϣ������ų鶯�˼��¾����ˡ�",'','fpk4')
   --	create_trigger_t('pk9','^(> )*��������������޷�����','','cut_corpse2')

   --  SetTriggerOption("pk7","group","pk3")
   --  SetTriggerOption("pk8","group","pk4")
   --  SetTriggerOption("pk9","group","pk4")
   exe("chat pker�ε���:" .. pker.name .. pker.id)
   exe("kill " .. pker.id)
end

function fpk4()
   exe("heng corpse")
   CloseLog()
   Openfpk()
   return check_bei(main)
end
function pk_cut_corpse1()
   exe("heng corpse")
   return exe("heng corpse")
end

function pk_cut_corpse2()
   weapon_unwield()
   weaponWieldCut()
   return exe("heng corpse")
end
