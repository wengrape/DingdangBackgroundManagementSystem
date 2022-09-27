<template>
  <div>
    <h1 style="margin-bottom: 10px; font-size: 30px; color: pink">
      近7天畅借排行榜
    </h1>

    <el-carousel :interval="3000" type="card" height="200px" width="400px">
      <el-carousel-item v-for="item in imgData" :key="item">
        <router-link to="/visualdata">
          <span class="title" style="color: #695947">{{ item.title }}</span>
          <h3 class="medium" style="margin: 10px">
            <img :src="item.src2" width="30px" height="20px" class="bhb2" />
            <img
              :src="item.src4"
              width="120px"
              height="160px"
              class="booktitle"
            />
            <img :src="item.src1" width="30px" height="20px" class="bhb1" />
            <img
              :src="item.src5"
              width="120px"
              height="180px"
              class="booktitle"
            />
            <img :src="item.src3" width="30px" height="20px" class="bhb3" />
            <img
              :src="item.src6"
              width="120px"
              height="160px"
              class="booktitle"
            />
          </h3>
        </router-link>
      </el-carousel-item>
    </el-carousel>
    <el-card class="box-card" v-for="(c, index) in cardData" :key="index">
      <i :class="c.icon" style="font-size: 30px; color: red"
        ><span style="color: skyblue"> {{ c.title }}</span></i
      >

      <br />
      <br />
      <p>
        上星期借书:<span style="font-size: 28px">{{ c.data1 }}</span>
      </p>
      <br />
      <p>
        上星期还书:<span>{{ c.data1 }}</span>
      </p>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "HomeMessage",
  data() {
    return {
      imgData: [
        {
          title: "小说类",
          src1: require("../../assets/bhb/dd_book_no_01.gif"),
          src4: require("../../assets/xsl/hz.jpg"),
          src2: require("../../assets/bhb/dd_book_no_02.gif"),
          src5: require("../../assets/xsl/sc.jpg"),
          src3: require("../../assets/bhb/dd_book_no_03.gif"),
          src6: require("../../assets/xsl/ssyzzgn.jpg"),
        },
        {
          title: "文学类",
          src1: require("../../assets/bhb/dd_book_no_01.gif"),
          src4: require("../../assets/wx/fsqklly01.jpg"),
          src2: require("../../assets/bhb/dd_book_no_02.gif"),
          src5: require("../../assets/wx/sy02.jpg"),
          src3: require("../../assets/bhb/dd_book_no_03.gif"),
          src6: require("../../assets/wx/zgfz03.jpg"),
        },
        {
          title: "少儿类",
          src1: require("../../assets/bhb/dd_book_no_01.gif"),
          src4: require("../../assets/sr/xwz01.jpg"),
          src2: require("../../assets/bhb/dd_book_no_02.gif"),
          src5: require("../../assets/sr/lwm02.jpg"),
          src3: require("../../assets/bhb/dd_book_no_03.gif"),
          src6: require("../../assets/sr/gw03.jpg"),
        },
        {
          title: "计算机类",
          src1: require("../../assets/bhb/dd_book_no_01.gif"),
          src4: require("../../assets/jsj/python01.jpg"),
          src2: require("../../assets/bhb/dd_book_no_02.gif"),
          src5: require("../../assets/jsj/js02.jpg"),
          src3: require("../../assets/bhb/dd_book_no_03.gif"),
          src6: require("../../assets/jsj/java03.jpg"),
        },
        {
          title: "经济管理类",
          src1: require("../../assets/bhb/dd_book_no_01.gif"),
          src4: require("../../assets/jjgl/zkl01.jpg"),
          src2: require("../../assets/bhb/dd_book_no_02.gif"),
          src5: require("../../assets/jjgl/zbl02.jpg"),
          src3: require("../../assets/bhb/dd_book_no_03.gif"),
          src6: require("../../assets/jjgl/jz03.jpg"),
        },
        {
          title: "科技科普类",
          src1: require("../../assets/bhb/dd_book_no_01.gif"),
          src4: require("../../assets/kjkp/dban01.jpg"),
          src2: require("../../assets/bhb/dd_book_no_02.gif"),
          src5: require("../../assets/kjkp/zhdgb02.jpg"),
          src3: require("../../assets/bhb/dd_book_no_03.gif"),
          src6: require("../../assets/kjkp/xdn03.jpg"),
        },
      ],
      cardData: [
        { icon: "el-icon-apple", data1: 1234, data2: 1013, title: "小说类" },
        { icon: "el-icon-pear", data1: 3234, data2: 876, title: "文学类" },
        { icon: "el-icon-orange", data1: 2734, data2: 2132, title: "少儿类" },
        { icon: "el-icon-coffee", data1: 2234, data2: 1423, title: "计算机类" },
        {
          icon: "el-icon-ice-tea",
          data1: 1234,
          data2: 1123,
          title: "经济管理类",
        },
        {
          icon: "el-icon-ice-drink",
          data1: 2234,
          data2: 1123,
          title: "科技科普类",
        },
      ],
    };
  },
};
</script>

<style>
.el-carousel__item h3 {
  color: #695947;
  font-size: 14px;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  /* background-color: skyblue; */
  background: linear-gradient(45deg, skyblue, red);
}

.el-carousel__item:nth-child(2n + 1) {
  background: linear-gradient(60deg, khaki, orange, pink);
}

.bhb1 {
  position: absolute;
  top: 10px;
  left: 340px;
}
.bhb2 {
  position: absolute;
  top: 30px;
  left: 190px;
}
.bhb3 {
  position: absolute;
  top: 30px;
  left: 490px;
}
.booktitle {
  margin-left: 30px;
}
.title {
  position: absolute;
  top: 10px;
  left: 20px;
  font-size: 20px;
}
.text {
  font-size: 14px;
}

.item {
  padding: 18px 0;
}

.box-card {
  width: 25%;
  float: left;
  margin-left: 60px;
  margin-top: 20px;
}
</style>