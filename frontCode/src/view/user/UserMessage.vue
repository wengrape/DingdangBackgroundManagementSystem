<template>
  <div id="user">
    <div id="div1" v-show="isDlZc">
      <span id="span1" @click="zcAppear">注册</span>
      <span id="span2" @click="dlAppear">登录</span>
    </div>
    <div id="div2" v-show="isZc">
      <table>
        <tr>
          <td>名字:</td>
          <td><input type="text" name="username" v-model="zc.zcusername" /></td>
        </tr>

        <tr>
          <td>密码:</td>
          <td>
            <input type="password" name="password" v-model="zc.zcpassword" />
          </td>
        </tr>
        <tr>
          <td></td>

          <td><button id="zc" @click="zuUser">注册</button></td>
        </tr>
      </table>
    </div>
    <div id="div4" v-show="isDl">
      <table>
        <tr>
          <td>名字:</td>
          <td><input type="text" name="username" v-model="dl.dlusername" /></td>
        </tr>

        <tr>
          <td>密码:</td>
          <td>
            <input type="password" name="password" v-model="dl.dlpassword" />
          </td>
        </tr>
        <tr>
          <td></td>

          <td>
            <button id="dl" @click="dlUser">登录</button>
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  name: "UserMessage",
  data() {
    return {
      zc: { zcusername: "", zcpassword: "" },
      dl: { dlusername: "", dlpassword: "" },
      isDlZc: true,
      isDl: false,
      isZc: false,
    };
  },
  methods: {
    zcAppear() {
      this.isDlZc = false;
      this.isDl = false;
      this.isZc = true;
    },
    dlAppear() {
      this.isDlZc = false;
      this.isDl = true;
      this.isZc = false;
    },
    dlUser() {
      let that = this;
      this.$axios({
        method: "get",
        url: `http://127.0.0.1:3030/api/login?username=${this.dl.dlusername}&password=${this.dl.dlpassword}`,
      })
        .then(function (r) {
          if (r.data.token) {
            that.$store.state.token = r.data.token;

            that.$store.state.isTheme = true;

            localStorage.setItem("token", r.data.token);
            that.$router.push({
              name: "homemessage",
            });
          }
          console.log(r);
        })
        .catch((results) => console.log("失败了！", results));
    },
    zuUser() {
      this.$axios({
        url: "http://127.0.0.1:3030/api/reguser",
        method: "post",
        // "Content-Type": "text/html; charset=utf-8",
        // headers: {
        //   "content-type": "text/html; charset=utf-8",
        // },
        data: {
          username: this.zc.zcusername,
          password: this.zc.zcpassword,
        },
      })
        .then(function (r) {
          console.log(r);
        })
        .catch(function (err) {
          console.log(err);
        });
    },
  },
};
</script>

<style  scoped>
* {
  padding: 0px;
  margin: 0px;
}
#user {
  width: 100%;
  height: 100%;
  background-image: url("../../assets/preview(4).jpg");
  background-size: 100% 100%;
}

#div1 {
  position: relative;
  top: 150px;
  left: 600px;
  width: 400px;
  height: 300px;
  border-radius: 20%;
  background: linear-gradient(45deg, pink, skyblue, aqua, pink, skyblue, aqua);
  opacity: 0.4;
}

#span1 {
  position: absolute;
  left: 100px;
  top: 130px;
  opacity: 1;
  font-size: 37px;
  font-weight: 700;
  cursor: pointer;
}
#span2 {
  position: absolute;
  left: 240px;
  top: 130px;
  opacity: 1;
  font-size: 37px;
  font-weight: 700;
  cursor: pointer;
}
#div2,
#div4 {
  position: relative;
  left: 640px;
  top: 200px;
  width: 360px;
  height: 200px;
  background: linear-gradient(60deg, orange, pink, skyblue, orange);
  background: rgba(0, 0, 0, 5%);
}
table {
  padding: 30px;
}

table tr td input {
  width: 230px;
  height: 24px;
  margin-top: 10px;
}

table tr td button {
  margin-left: 70px;
  margin-top: 30px;
  width: 80px;
  height: 34px;
  background: linear-gradient(
    45deg,
    rgb(25, 122, 160, 70%),
    rgb(217, 78, 198, 70%),
    rgb(21, 224, 224, 70%)
  );
  border-radius: 20px;
  border: 1px solid skyblue;
  cursor: pointer;
}
</style>>
 


