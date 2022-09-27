<template>
  <div>
    <h1 style="margin-bottom: 20px">意见箱平台</h1>
    <el-card class="box-card-one">
      <el-card class="box-card-one-one">
        <img
          :src="personImg"
          alt="管理员图片"
          class="box-card-one-one-img"
          width="70px"
          height="70px"
        />
        <h3>管理员</h3>
      </el-card>
      <el-card class="box-card-one-two">
        <div
          class="box-card-one-two-div"
          v-for="(t, index) in tableData"
          :key="index"
          @click="showChat(t)"
        >
          <img
            :src="t.txImg"
            alt="头像图片"
            width="50px"
            height="50px"
            class="box-card-one-two-div-img"
          />
          <span class="div_span1">{{ t.name }}</span>
          <span class="div_span2">{{ t.time }}</span>
          <span class="div_span3">{{ t.relation }}</span>
          <span class="div_span4 div_p">{{ t.context }}</span>
        </div>
      </el-card>
    </el-card>
    <el-card class="box-card-two">
      <div class="box-card-two-div" v-show="!isChat">
        <div class="box-card-two-div-add-one">
          <h1 style="text-align: left; line-height: 100px; margin-left: 30px">
            {{ cardData.name }}
          </h1>
        </div>
        <div class="box-card-two-div-one">
          <img
            :src="cardData.txImg"
            alt="头像"
            class="box-card-two-div-one-img"
          />
          <div class="box-card-two-div-one-one">
            <div class="box-card-two-div-one-one-one"></div>
            <p>{{ cardData.context }}</p>
          </div>
        </div>
      </div>
      <h1 class="box-card-two-h1" v-show="isChat">还未开启意见箱！</h1>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "PageMessageone",
  data() {
    return {
      isChat: true,
      personImg: require("../../assets/ts.jpg"),
      tableData: [
        {
          txImg: require("../../assets/txtp/tp01.jpg"),
          name: "王小虎",
          time: "9:00",
          relation: "好友",
          context:
            "1.影响图书借阅的原因有以下几点，周末闭馆， 一次性借阅的图书太少，图书的种类有欠缺，分类不明确。 2.图 书馆的座位不足，图书馆的环境有待提高。 （1）建议图书馆提早开馆时间、延后闭馆时间，最好在周三下午和 周六日都能借阅图书。 (2)建议图书馆增加图书数量和种类， 多增加些人文类和适应大学生 现状的书籍。 常购进新书。 (3)建议在图书分类上更加明确",
        },
        {
          txImg: require("../../assets/txtp/tp02.jpg"),
          name: "787f_67",
          time: "7:00",
          relation: "陌生人",
          context:
            "1.影响图书借阅的原因有以下几点，周末闭馆， 一次性借阅的图书太少，图书的种类有欠缺，分类不明确。 2.图 书馆的座位不足，图书馆的环境有待提高。 （1）建议图书馆提早开馆时间、延后闭馆时间，最好在周三下午和 周六日都能借阅图书。 (2)建议图书馆增加图书数量和种类， 多增加些人文类和适应大学生 现状的书籍。 常购进新书。 (3)建议在图书分类上更加明确",
        },
        {
          txImg: require("../../assets/txtp/tp03.jpg"),
          name: "9876_iu",
          time: "4:20",
          relation: "陌生人",
          context:
            "1.影响图书借阅的原因有以下几点，周末闭馆， 一次性借阅的图书太少，图书的种类有欠缺，分类不明确。 2.图 书馆的座位不足，图书馆的环境有待提高。 （1）建议图书馆提早开馆时间、延后闭馆时间，最好在周三下午和 周六日都能借阅图书。 (2)建议图书馆增加图书数量和种类， 多增加些人文类和适应大学生 现状的书籍。 常购进新书。 (3)建议在图书分类上更加明确",
        },

        {
          txImg: require("../../assets/txtp/tp04.jpg"),
          name: "09io_89",
          time: "2:10",
          relation: "好友",
          context:
            "1.影响图书借阅的原因有以下几点，周末闭馆， 一次性借阅的图书太少，图书的种类有欠缺，分类不明确。 2.图 书馆的座位不足，图书馆的环境有待提高。 （1）建议图书馆提早开馆时间、延后闭馆时间，最好在周三下午和 周六日都能借阅图书。 (2)建议图书馆增加图书数量和种类， 多增加些人文类和适应大学生 现状的书籍。 常购进新书。 (3)建议在图书分类上更加明确",
        },

        {
          txImg: require("../../assets/txtp/tp05.jpg"),
          name: "王小虎",
          time: "1:00",
          relation: "好友",
          context:
            "1.影响图书借阅的原因有以下几点，周末闭馆， 一次性借阅的图书太少，图书的种类有欠缺，分类不明确。 2.图 书馆的座位不足，图书馆的环境有待提高。 （1）建议图书馆提早开馆时间、延后闭馆时间，最好在周三下午和 周六日都能借阅图书。 (2)建议图书馆增加图书数量和种类， 多增加些人文类和适应大学生 现状的书籍。 常购进新书。 (3)建议在图书分类上更加明确",
        },

        {
          txImg: require("../../assets/txtp/tp06.jpg"),
          name: "9876_uiuy7",
          time: "昨天",
          relation: "好友",
          context:
            "1.影响图书借阅的原因有以下几点，周末闭馆， 一次性借阅的图书太少，图书的种类有欠缺，分类不明确。 2.图 书馆的座位不足，图书馆的环境有待提高。 （1）建议图书馆提早开馆时间、延后闭馆时间，最好在周三下午和 周六日都能借阅图书。 (2)建议图书馆增加图书数量和种类， 多增加些人文类和适应大学生 现状的书籍。 常购进新书。 (3)建议在图书分类上更加明确",
        },
        {
          txImg: require("../../assets/txtp/tp07.jpg"),
          name: "李贺",
          time: "昨天",
          relation: "好友",
          context: "你好,有活着吗？",
        },

        {
          txImg: require("../../assets/txtp/tp08.jpg"),
          name: "白雪",
          time: "昨天",
          relation: "好友",
          context: "你好,有人间好玩吗？",
        },

        {
          txImg: require("../../assets/txtp/tp09.jpg"),
          name: "iuo_212",
          time: "前天",
          relation: "陌生人",
          context: "你好,请问有余华的活着吗？",
        },
        {
          txImg: require("../../assets/txtp/tp10.jpg"),
          name: "098_oi90",
          time: "前天",
          relation: "好友",
          context: "你好",
        },

        {
          txImg: require("../../assets/txtp/tp11.jpg"),
          name: "09o_09iut5",
          time: "前天",
          relation: "陌生人",
          context: "你好,请问有余华的活着吗？",
        },

        {
          txImg: require("../../assets/txtp/tp12.jpg"),
          name: "iuyt_98",
          time: "前天",
          relation: "好友",
          context: "你好,请问有余华的活着吗？",
        },
        {
          txImg: require("../../assets/txtp/tp13.jpg"),
          name: "ioi_kj9",
          time: "前天",
          relation: "好友",
          context: "你好,请问有余华的活着吗？",
        },

        {
          txImg: require("../../assets/txtp/tp14.jpg"),
          name: "90i_iu8",
          time: "前天",
          relation: "好友",
          context: "你好,请问有余华的活着吗？",
        },

        {
          txImg: require("../../assets/txtp/tp15.jpg"),
          name: "u89_89j",
          time: "前天",
          relation: "好友",
          context: "你好,请问有余华的活着吗？",
        },
      ],
      cardData: { txImg: "", context: "", name: "" },
    };
  },
  methods: {
    showChat(t) {
      this.isChat = false;
      this.cardData.txImg = t.txImg;
      this.cardData.context = t.context;
      this.cardData.name = t.name;
    },
  },
};
</script>

<style>
* {
  margin: 0px;
  padding: 0px;
}

.box-card-one {
  float: left;
  width: 26%;
  height: 580px;
  margin-left: 180px;
  /* background-color: ; */
}
.box-card-two-div-add-one {
  width: 100%;
  height: 100px;
  background-color: slategray;
}
.box-card-one-one {
  position: relative;
  width: 128%;
  height: 100px;
  margin-top: -20px;
  margin-left: -20px;
  background-color: black;
  color: whitesmoke;
  opacity: 0.6;
}
.box-card-one-one-img {
  position: absolute;
  top: 10px;
  left: 50px;
  border-radius: 50%;
}

.box-card-one-two {
  position: relative;
  width: 138%;
  height: 480px;
  margin-left: -20px;
  overflow: scroll;
}
.box-card-one-two-div {
  position: relative;
  background-color: slategray;
  width: 300px;
  height: 80px;
  border: 1px solid black;
  margin-left: -20px;
  margin-top: -20px;
  cursor: pointer;
}
.box-card-one-two-div:hover {
  background-color: black;
  color: whitesmoke;
}
.box-card-one-two-div:hover .div_span3 {
  background-color: black;
  color: whitesmoke;
}
.div_span1 {
  position: absolute;
  left: 70px;
  top: 10px;
}
.div_span2 {
  position: absolute;
  right: 20px;
  top: 10px;
}
.div_span3 {
  position: absolute;
  left: 160px;
  top: 10px;
  border-radius: 20%;
  border: 1px solid black;
  background-color: yellow;
  opacity: 0.4;
}
.div_span4 {
  position: absolute;
  left: 70px;
  top: 30px;
}
.box-card-one-two-div-img {
  position: absolute;
  top: 8px;
  left: 0px;
}
.box-card-two {
  position: relative;
  float: left;
  width: 50%;
  height: 580px;
  margin-left: 0px;
}
.box-card-two-div-one-img {
  position: absolute;
  top: 150px;
  left: 30px;
  width: 50px;
  height: 50px;
}
.box-card-two-h1 {
  position: absolute;
  top: 10%;
  left: 35%;
  line-height: 500px;
  color: slategray;
}
.box-card-two-div-one-one {
  position: absolute;
  top: 150px;
  left: 110px;
  width: 300px;
  border-radius: 10%;
  background-color: darkgoldenrod;
  opacity: 0.7;
  text-align: left;
  padding: 10px;
}
.box-card-two-div-one-one-one {
  position: absolute;
  top: 16px;
  left: -18px;
  border-style: solid;
  border-width: 10px 10px 10px 10px;
  border-color: transparent darkgoldenrod transparent transparent;
  width: 0px;
  height: 0px;
}
.box-card-two-div-two {
  position: absolute;
  bottom: 0px;
  left: 0px;
  width: 100%;
  height: 24%;
  background-color: tan;
}
.div_p {
  width: 160px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>