<template>
  <div style="padding-left: 130px; padding-right: 130px">
    <h1 style="margin-bottom: 20px; font-size: 35px">管理员个人中心管理</h1>
    <el-card shadow="hover">
      <div class="card_div1">
        <img :src="imgPerson" alt="管理员头像" class="card_img" />
      </div>
      <div class="card_div2">
        <h1>
          管理员_302910299 &nbsp;&nbsp;&nbsp;<span
            style="border: 1px solid slategray; border-radius: 15%"
            >&nbsp;&nbsp;&nbsp;正式员工&nbsp;&nbsp;&nbsp;</span
          >
        </h1>
        <br />

        <el-progress
          :text-inside="true"
          :stroke-width="28"
          :percentage="83"
          status="warning"
        >
        </el-progress>
        <br />
        <span style="border-radius: 15%; background-color: aquamarine"
          >工龄&nbsp;&nbsp;<span style="font-size: 20px; color: skyblue">3</span
          >&nbsp;&nbsp;年</span
        >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span
          >834&nbsp;&nbsp;/&nbsp;&nbsp;<span style="color: slategrey"
            >1000</span
          ></span
        >
        <el-button :plain="true" @click="open" style="margin-left: 200px"
          >修改个人信息</el-button
        >
        <br />
        <br />
      </div>
    </el-card>
    <br />

    <h3>
      <i class="el-icon-upload" style="font-size: 40px; color: aquamarine"></i>
      &nbsp;每日任务
    </h3>
    <br />
    <el-card>
      <div
        class="card_div4"
        v-for="i in imgItems"
        :key="i.title"
        style="float: left; width: 32%"
      >
        <img :src="i.src1" alt="图片" style="border-radius: 50%" />
        <br />
        <h4>{{ i.title }}</h4>
        <br />
        <h6>
          <span style="background-color: slategrey; color: white">
            &nbsp;&nbsp;&nbsp;
            {{ i.context }}&nbsp;&nbsp;&nbsp;
          </span>
        </h6>
        <br />
      </div>
    </el-card>

    <el-card class="demo-ruleForm-card" style="width: 40%" v-show="isShow">
      <el-form
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="管理员名称" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="出生的地域" prop="region">
          <el-select v-model="ruleForm.region" placeholder="请选择活动区域">
            <el-option label="A城" value="shanghai"></el-option>
            <el-option label="S市" value="shanghai"></el-option>
            <el-option label="B城" value="shanghai"></el-option>
            <el-option label="A国" value="shanghai"></el-option>
            <el-option label="C市" value="shanghai"></el-option>
            <el-option label="D城" value="beijing"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="出生的时间" required>
          <el-col :span="11">
            <el-form-item prop="date1">
              <el-date-picker
                type="date"
                placeholder="选择日期"
                v-model="ruleForm.date1"
                style="width: 100%"
              ></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col class="line" :span="2">-</el-col>
          <el-col :span="11">
            <el-form-item prop="date2">
              <el-time-picker
                placeholder="选择时间"
                v-model="ruleForm.date2"
                style="width: 100%"
              ></el-time-picker>
            </el-form-item>
          </el-col>
        </el-form-item>

        <el-form-item label="管理员爱好" prop="type">
          <el-checkbox-group v-model="ruleForm.type">
            <el-checkbox label="美食" name="type"></el-checkbox>
            <el-checkbox label="运动" name="type"></el-checkbox>
            <el-checkbox label="睡觉" name="type"></el-checkbox>
            <el-checkbox label="打豆豆" name="type"></el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="管理员性别" prop="resource">
          <el-radio-group v-model="ruleForm.resource">
            <el-radio label="男"></el-radio>
            <el-radio label="女"></el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="个性签名板" prop="desc">
          <el-input type="textarea" v-model="ruleForm.desc"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')"
            >立即创建</el-button
          >
          <el-button @click="resetForm('ruleForm')">重置</el-button>
        </el-form-item>
        <el-button class="person_button" @click="becomeShow">X</el-button>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "PersonMessage",
  data() {
    return {
      isShow: false,
      imgPerson: require("../../assets/ts.jpg"),
      imgItems: [
        {
          src1: require("../../assets/personmessage/wc01.png"),
          title: "每日打卡",
          context: "营养液到手10个点",
        },
        {
          src1: require("../../assets/personmessage/wc01.png"),
          title: "数据进行统计",
          context: "营养液到手20个点",
        },
        {
          src1: require("../../assets/personmessage/wc02.png"),
          title: "数据进行处理",
          context: "未完成",
        },
      ],
      ruleForm: {
        name: "",
        region: "",
        date1: "",
        date2: "",
        delivery: false,
        type: [],
        resource: "",
        desc: "",
      },
      rules: {
        name: [
          { required: true, message: "请输入管理员名称", trigger: "blur" },
          { min: 3, max: 5, message: "长度在 3 到 5 个字符", trigger: "blur" },
        ],
        region: [
          { required: true, message: "请选择出生地区", trigger: "change" },
        ],
        date1: [
          {
            type: "date",
            required: true,
            message: "请选择日期",
            trigger: "change",
          },
        ],
        date2: [
          {
            type: "date",
            required: true,
            message: "请选择时间",
            trigger: "change",
          },
        ],
        type: [
          {
            type: "array",
            required: true,
            message: "请至少选择一个活动爱好",
            trigger: "change",
          },
        ],
        resource: [
          { required: true, message: "请选择性别", trigger: "change" },
        ],
        desc: [{ required: true, message: "请填写个性签名", trigger: "blur" }],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          alert("submit!");
          this.isShow = false;
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    open() {
      this.isShow = true;
    },
    becomeShow() {
      this.isShow = false;
    },
  },
};
</script>

<style>
.card_img {
  border-radius: 50%;
  width: 100px;
  height: 100px;
}
.card_div1 {
  float: left;
}
.card_div2 {
  float: left;
  margin-left: 50px;
}
.demo-ruleForm-card {
  position: absolute;
  top: 120px;
  left: 600px;
}
.person_button {
  position: absolute;
  top: -15px;
  right: -15px;
  border-radius: 50%;
}
</style>