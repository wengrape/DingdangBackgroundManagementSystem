<template>
  <div id="app" class="thememessage">
    <!-- <MainMessage /> -->
    <!-- 路由展示 -->
    <router-view class="thememessage"></router-view>
    <div id="becometheme" class="thememessage" v-show="isTheme">
      <div style="margin-top: 40px; margin-left: 30px">
        <i
          class="el-icon-sunrise-1"
          style="font-size: 30px"
          @click="whiteTheme"
        ></i>
        <el-switch
          style="margin-left: 20px; margin-top: -8px"
          v-model="value2"
          active-color="black"
          inactive-color="yellow"
          disabled
        >
        </el-switch>
        <i
          class="el-icon-moon-night"
          style="font-size: 30px; margin-left: 20px"
          @click="blackTheme"
        ></i>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "App",
  data() {
    return {
      value2: false,
      currentSkinName: "defaultTheme",
      themeColorObj: {
        defaultTheme: {
          title: "浅色主题", // 主题名称
          mainColor: "#ffffff", // 全局主题色
          mainTextColor: "black", // 全局默认文字颜色
          mainBgColor: "#f0f2f5", // 全局默认背景色
        },
        darkTheme: {
          title: "深色主题",
          mainColor: "#01305F",
          mainTextColor: "#ffffff",
          mainBgColor: "#012447",
        },
      },
    };
  },
  computed: {
    isTheme() {
      return this.$store.state.isTheme;
    },
  },
  methods: {
    whiteTheme() {
      this.value2 = false;
      console.log("value2:", this.value2);
      let themeName = this.currentSkinName || "defaultTheme";

      const typeObj = {
        darkTheme: "../public/theme/darkTheme/theme/index.css",
        defaultTheme: "../public/theme/defaultTheme/theme/index.css",
      };
      document.getElementById("themeStyle").href = typeObj[themeName];
      //  设置主题变量
      const themeColor = this.themeColorObj[themeName];
      document.documentElement.style.setProperty(
        "--mainColor",
        themeColor.mainColor
      );
      document.documentElement.style.setProperty(
        "--mainTextColor",
        themeColor.mainTextColor
      );
      document.documentElement.style.setProperty(
        "--mainBgColor",
        themeColor.mainBgColor
      );
    },
    blackTheme() {
      this.value2 = true;
      console.log("value2:", this.value2);
      let themeName = "darkTheme";

      const typeObj = {
        darkTheme: "../public/theme/darkTheme/theme/index.css",
        defaultTheme: "../public/theme/defaultTheme/theme/index.css",
      };
      document.getElementById("themeStyle").href = typeObj[themeName];
      //  设置主题变量
      const themeColor = this.themeColorObj[themeName];
      document.documentElement.style.setProperty(
        "--mainColor",
        themeColor.mainColor
      );
      document.documentElement.style.setProperty(
        "--mainTextColor",
        themeColor.mainTextColor
      );
      document.documentElement.style.setProperty(
        "--mainBgColor",
        themeColor.mainBgColor
      );
    },
  },
  mounted() {
    console.log("value2:", this.value2);
  },
  // #region
  // mounted() {
  //   let that = this;
  //   // 发出请求

  //   this.$axios({
  //     method: "get",
  //     url: "http://127.0.0.1:5050/lending/seek/all",
  //   })
  //     .then(function (response) {
  //       // response.data.pipe(fs.createWriteStream("ada_lovelace.jpg"));

  //       that.$store.state.booklending = response.data;
  //       console.log(response);
  //     })
  //     .catch(function (error) {
  //       console.log(error);
  //     });

  //   console.log(
  //     "this.$store.state.booklending:",
  //     this.$store.state.booklending
  //   );
  // },
  // #endregion
};
</script >
<style lang="scss">
i:hover {
  color: skyblue;
}
#becometheme {
  position: absolute;
  left: 60px;
  top: 606px;
  border-radius: 15%;
  width: 200px;
  height: 100px;
  background-color: whitesmoke;
  border: 2px solid darkgray;
  box-shadow: 3px 4px 4px 4px darkgray;
}
* {
  padding: 0px;
  margin: 0px;
}
#app {
  height: 100vh;
}
body {
  color: var(--mainTextColor);
  background: var(--mainColor);
}
html,
.thememessage,
#app {
  color: var(--mainTextColor);
  background: var(--mainColor);
}

// html {
//   filter: invert(6) hue-rotate(180deg);
// }
// img,
// video {
//   filter: invert(1) hue-rotate(180deg);
// }
</style>
