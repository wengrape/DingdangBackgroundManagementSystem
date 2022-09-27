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
      <el-table-column label="编号" width="180">
        <template slot-scope="scope">
          <i class="el-icon-time"></i>
          <span style="margin-left: 10px">{{ scope.row.id }}</span>
        </template>
      </el-table-column>
      <el-table-column label="书名" width="280">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p>书名: {{ scope.row.book_name }}</p>
            <p>借书人的名字: {{ scope.row.lending_person }}</p>
            <p>住址: {{ scope.row.lending_date }}</p>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.book_name }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column label="借书人的名字" width="240">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p>书名: {{ scope.row.book_name }}</p>
            <p>借书人的名字: {{ scope.row.lending_person }}</p>
            <p>借书日期: {{ scope.row.lending_date }}</p>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.lending_person }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column label="借书日期" width="280">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p>书名: {{ scope.row.book_name }}</p>
            <p>借书人的名字: {{ scope.row.lending_person }}</p>
            <p>借书日期: {{ scope.row.lending_date }}</p>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.lending_date }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="操作">
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
      <el-form-item label="书名:">
        <el-input
          v-model="formLabelAlign.book_name"
          style="width: 70%; margin-right: 40px"
        ></el-input>
      </el-form-item>
      <el-form-item label="借书人的名字:">
        <el-input
          v-model="formLabelAlign.lending_person"
          style="width: 70%; margin-right: 40px"
        ></el-input>
      </el-form-item>
      <el-form-item label="借书日期:">
        <el-input
          v-model="formLabelAlign.lending_date"
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
        lending_person: "",
        book_name: "",
        lending_date: "",
      },

      // 接收修改数据行
      lendingdata: "",
    };
  },
  computed: {
    booklending() {
      return this.$store.state.booklending;
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
      //#region
      // this.$axios({
      //   url: "http://127.0.0.1:5050/lending/seek",
      //   method: "get",
      //   data: `book_name=${this.dataname}`,
      //   // data: { book_name: this.dataname },
      //   headers: {
      //     "Content-Type": "application/json; charset=utf-8",
      //   },
      //   // responseType: "json",
      //   // params: {
      //   //   //请求参数
      //   //   book_name: this.dataname,
      //   // },
      // })
      //   .then(function (response) {
      //     console.log(response);
      //   })
      //   .catch(function (error) {
      //   console.log(error);
      // });
      // #endregion

      this.$axios({
        url: `http://127.0.0.1:5050/lending/seek?book_name=${this.dataname}`,
        method: "get",
        // params: { book_name: this.dataname },
      })
        .then(function (response) {
          that.$store.state.booklending = response.data;
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
      this.formLabelAlign.book_name = "";
      this.formLabelAlign.lending_person = "";
      this.formLabelAlign.lending_date = "";
    },
    // 确认添加
    addData() {
      this.isForm = !this.isForm;
      let that = this;
      this.$axios({
        url: "http://127.0.0.1:5050/lending/seek",
        method: "post",
        data: {
          id: this.formLabelAlign.id,
          book_name: this.formLabelAlign.book_name,
          lending_person: this.formLabelAlign.lending_person,
          lending_date: this.formLabelAlign.lending_date,
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
          url: "http://127.0.0.1:5050/lending/seek/all",
        })
          .then(function (response) {
            that.$store.state.booklending = response.data;
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
      this.formLabelAlign.book_name = row.book_name;
      this.formLabelAlign.lending_person = row.lending_person;
      this.formLabelAlign.lending_date = row.lending_date.slice(0, -14);
      console.log(index, row);
    },
    // 确认修改
    submitForm() {
      this.isForm = !this.isForm;
      let that = this;
      this.$axios({
        url: "http://127.0.0.1:5050/lending/seek",
        method: "put",
        data: {
          id: this.formLabelAlign.id,
          book_name: this.formLabelAlign.book_name,
          lending_person: this.formLabelAlign.lending_person,
          lending_date: this.formLabelAlign.lending_date,
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
          url: "http://127.0.0.1:5050/lending/seek/all",
        })
          .then(function (response) {
            that.$store.state.booklending = response.data;
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
      // #region
      // 批量发送
      // this.$axios
      //   .all([
      //     {
      //       url: "http://127.0.0.1:5050/lending/seek",
      //       method: "delete",
      //       data: { id: row.id },
      //     },
      //     {
      //       method: "get",
      //       url: "http://127.0.0.1:5050/lending/seek/all",
      //     },
      //   ])
      //   .then(function (response) {
      //     that.$store.state.booklending = response.data;
      //     console.log("Lending_response全部数据:", response);
      //   })
      //   .catch(function (error) {
      //     console.log(error);
      //   });
      // #endregion

      this.$axios({
        url: "http://127.0.0.1:5050/lending/seek",
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
          url: "http://127.0.0.1:5050/lending/seek/all",
        })
          .then(function (response) {
            that.$store.state.booklending = response.data;
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
      url: "http://127.0.0.1:5050/lending/seek/all",
    })
      .then(function (response) {
        that.$store.state.booklending = response.data;
        console.log("Lending_response全部数据:", response);
      })
      .catch(function (error) {
        console.log(error);
      });

    console.log(
      "this.$store.state.booklending:",
      this.$store.state.booklending
    );
  },
};
</script>
<style lang="less" scoped>
#div_form {
  position: absolute;
  top: 230px;
  left: 570px;
  width: 30%;
  height: 46%;
  background-image: url("../../assets/ts.jpg");
  background-size: 76%;
  z-index: 50;
}
#serchdata::placeholder {
  color: skyblue;
}
</style>
