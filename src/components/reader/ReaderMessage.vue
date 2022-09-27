<template>
  <div>
    <el-button
      type="primary"
      @click="addTabledata"
      style="margin-right: 480px; margin-bottom: 20px"
    >
      <i class="el-icon-plus" style="font-size: 22px"></i>
      <span style="font-size: 22px">加入一条新语句</span>
    </el-button>
    <input
      type="text"
      placeholder="输入书名搜索"
      autocomplete="on"
      v-model="dataname"
      style="width: 240px; height: 30px; margin-left: 120px"
      id="serchdata"
    />
    <el-button type="primary" @click="searchData" style="margin-left: 10px"
      >确定</el-button
    >

    <el-table :data="booklending" style="width: 100%">
      <el-table-column label="编号" width="80">
        <template slot-scope="scope">
          <i class="el-icon-time"></i>
          <span style="margin-left: 10px">{{ scope.row.id }}</span>
        </template>
      </el-table-column>

      <el-table-column label="读者名" width="140">
        <template slot-scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.reader_name }}</el-tag>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="读者昵称" width="100">
        <template slot-scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.reader_nickname }}</el-tag>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="读者性别" width="80">
        <template slot-scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.reader_sex }}</el-tag>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="读者年龄" width="80">
        <template slot-scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.reader_age }}</el-tag>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="读者地址" width="140">
        <template slot-scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.reader_address }}</el-tag>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="最近借的书名" width="240">
        <template slot-scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.book_name }}</el-tag>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="书借过的数量" width="80">
        <template slot-scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.leading_name }}</el-tag>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="书还过的数量" width="80">
        <template slot-scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.back_name }}</el-tag>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="操作" width="200">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">
            编辑
          </el-button>
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <el-form
      size="small"
      label-position="right"
      label-width="100px"
      :model="formLabelAlign"
      id="div_form"
      style="font-size: 26px"
      v-show="isForm"
    >
      <br />
      <el-form-item label="编码:">
        <el-input
          v-model="formLabelAlign.id"
          style="width: 70%; margin-right: 40px"
          :disabled="disabled"
        ></el-input>
      </el-form-item>

      <el-form-item label="读者名:">
        <el-input
          v-model="formLabelAlign.reader_name"
          style="width: 70%; margin-right: 40px"
        ></el-input>
      </el-form-item>

      <el-form-item label="读者昵称:">
        <el-input
          v-model="formLabelAlign.reader_nickname"
          style="width: 70%; margin-right: 40px"
        ></el-input>
      </el-form-item>
      <el-form-item label="读者性别:">
        <el-input
          v-model="formLabelAlign.reader_sex"
          style="width: 70%; margin-right: 40px"
        ></el-input>
      </el-form-item>
      <el-form-item label="读者年龄:">
        <el-input
          v-model="formLabelAlign.reader_age"
          style="width: 70%; margin-right: 40px"
        ></el-input>
      </el-form-item>
      <el-form-item label="读者地址:">
        <el-input
          v-model="formLabelAlign.reader_address"
          style="width: 70%; margin-right: 40px"
        ></el-input>
      </el-form-item>
      <el-form-item label="最近借的书名:">
        <el-input
          v-model="formLabelAlign.book_name"
          style="width: 70%; margin-right: 40px"
        ></el-input>
      </el-form-item>

      <el-form-item label="借书的数量:">
        <el-input
          v-model="formLabelAlign.leading_name"
          style="width: 70%; margin-right: 40px"
        ></el-input>
      </el-form-item>
      <el-form-item label="还书的数量:">
        <el-input
          v-model="formLabelAlign.back_name"
          style="width: 70%; margin-right: 40px"
        ></el-input>
      </el-form-item>

      <br />
      <el-form-item style="margin-right: 40px">
        <el-button type="primary" @click="submitForm" v-show="!isCj"
          >立即修改</el-button
        >
        <el-button type="primary" @click="addData" v-show="isCj"
          >立即创建</el-button
        >
        <el-button @click="resetForm">取消</el-button>
      </el-form-item>
      <br />
    </el-form>
  </div>
</template>

<script>
export default {
  name: "BookMessagetwo",
  data() {
    return {
      disabled: false,
      dataname: "",
      isForm: false,
      isCj: false,
      formLabelAlign: {
        id: "",
        reader_name: "",
        reader_nickname: "",
        reader_sex: "",
        reader_age: "",
        reader_address: "",
        book_name: "",
        leading_name: "",
        back_name: "",
      },

      // 接收修改数据行
      lendingdata: "",
    };
  },
  computed: {
    booklending() {
      return this.$store.state.readermanagement;
    },
  },
  methods: {
    // 取消添加或者修改
    resetForm() {
      this.isForm = !this.isForm;
    },
    // 搜索
    searchData() {
      let that = this;
      console.log("this.dataname:", this.dataname);
      this.$axios({
        url: `http://127.0.0.1:5050/reader/seek?book_name=${this.dataname}`,
        method: "get",
        // params: { book_name: this.dataname },
      })
        .then(function (response) {
          that.$store.state.readermanagement = response.data;
          console.log("Lending_response查找的数据:", response);
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    // 添加
    addTabledata() {
      this.disabled = false;
      this.isForm = !this.isForm;
      this.isCj = true;
      this.formLabelAlign.id = "";
      this.formLabelAlign.reader_name = "";
      this.formLabelAlign.reader_nickname = "";
      this.formLabelAlign.reader_sex = "";
      this.formLabelAlign.reader_age = "";
      this.formLabelAlign.reader_address = "";
      this.formLabelAlign.book_name = "";
      this.formLabelAlign.leading_name = "";
      this.formLabelAlign.back_name = "";
    },
    // 确认添加
    addData() {
      this.isForm = !this.isForm;
      let that = this;
      this.$axios({
        url: "http://127.0.0.1:5050/reader/seek",
        method: "post",
        data: {
          id: this.formLabelAlign.id,

          reader_name: this.formLabelAlign.reader_name,
          reader_nickname: this.formLabelAlign.reader_nickname,
          reader_sex: this.formLabelAlign.reader_sex,
          reader_age: this.formLabelAlign.reader_age,
          reader_address: this.formLabelAlign.reader_address,
          book_name: this.formLabelAlign.book_name,
          leading_name: this.formLabelAlign.leading_name,
          back_name: this.formLabelAlign.back_name,
        },
      })
        .then(function (response) {
          console.log("Lending_response添加数据", response);
        })
        .catch(function (error) {
          console.log(error);
        });
      this.$nextTick(() => {
        this.$axios({
          method: "get",
          url: "http://127.0.0.1:5050/reader/seek/all",
        })
          .then(function (response) {
            that.$store.state.readermanagement = response.data;
            console.log("Lending_response全部数据:", response);
          })
          .catch(function (error) {
            console.log(error);
          });
      });
    },
    // 修改
    handleEdit(index, row) {
      this.disabled = true;
      this.isForm = !this.isForm;
      this.isCj = false;
      this.lendingdata = row;
      this.formLabelAlign.id = row.id;
      this.formLabelAlign.reader_name = row.reader_name;
      this.formLabelAlign.reader_nickname = row.reader_nickname;
      this.formLabelAlign.reader_sex = row.reader_sex;
      this.formLabelAlign.reader_age = row.reader_age;
      this.formLabelAlign.reader_address = row.reader_address;
      this.formLabelAlign.book_name = row.book_name;
      this.formLabelAlign.leading_name = row.leading_name;
      this.formLabelAlign.back_name = row.back_name;
      console.log(index, row);
    },
    // 确认修改
    submitForm() {
      this.isForm = !this.isForm;
      let that = this;
      this.$axios({
        url: "http://127.0.0.1:5050/reader/seek",
        method: "put",
        data: {
          id: this.formLabelAlign.id,
          reader_name: this.formLabelAlign.reader_name,
          reader_nickname: this.formLabelAlign.reader_nickname,
          reader_sex: this.formLabelAlign.reader_sex,
          reader_age: this.formLabelAlign.reader_age,
          reader_address: this.formLabelAlign.reader_address,
          book_name: this.formLabelAlign.book_name,
          leading_name: this.formLabelAlign.leading_name,
          back_name: this.formLabelAlign.back_name,
        },
      })
        .then(function (response) {
          console.log("Lending_response修改数据", response);
        })
        .catch(function (error) {
          console.log(error);
        });
      this.$nextTick(() => {
        this.$axios({
          method: "get",
          url: "http://127.0.0.1:5050/reader/seek/all",
        })
          .then(function (response) {
            that.$store.state.readermanagement = response.data;
            console.log("Lending_response全部数据:", response);
          })
          .catch(function (error) {
            console.log(error);
          });
      });
    },
    // 删除
    handleDelete(index, row) {
      let that = this;

      this.$axios({
        url: "http://127.0.0.1:5050/reader/seek",
        method: "delete",
        data: { id: row.id },
      })
        .then(function (response) {
          console.log(response.data);
        })
        .catch(function (error) {
          console.log(error.log);
        });

      this.$nextTick(() => {
        this.$axios({
          method: "get",
          url: "http://127.0.0.1:5050/reader/seek/all",
        })
          .then(function (response) {
            that.$store.state.readermanagement = response.data;
            console.log("Lending_response全部数据:", response);
          })
          .catch(function (error) {
            console.log(error);
          });
      });

      console.log("删除的信息:", index, row.id);
    },
  },
  mounted() {
    let that = this;
    // 发出请求

    this.$axios({
      method: "get",
      url: "http://127.0.0.1:5050/reader/seek/all",
    })
      .then(function (response) {
        that.$store.state.readermanagement = response.data;
        console.log("Lending_response全部数据:", response);
      })
      .catch(function (error) {
        console.log(error);
      });

    console.log(
      "this.$store.state.readermanagement:",
      this.$store.state.readermanagement
    );
  },
};
</script>
<style lang="less" scoped>
#div_form {
  position: absolute;
  top: 130px;
  left: 570px;
  width: 30%;
  height: 86%;
  background-image: url("../../assets/ts.jpg");
  background-size: 76%;
  z-index: 50;
}
#serchdata::placeholder {
  color: skyblue;
}
</style>
