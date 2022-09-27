<template>
  <div>
    <h1>visualData</h1>
    <el-card class="box-card box-card1">
      <h1>上周借书的数量</h1>
      <div ref="mainone" style="width: 100%; height: 300px"></div>
    </el-card>
    <el-card class="box-card box-card2">
      <h1>上周归还书的数量</h1>
      <div ref="maintwo" style="width: 100%; height: 300px"></div>
    </el-card>
    <el-card class="box-card box-card3">
      <h1>上周最受欢迎的各类小说占比</h1>
      <div ref="mainthree" style="width: 110%; height: 300px"></div>
    </el-card>
    <el-card class="box-card box-card4">
      <h1>上周最受欢迎的5大书籍</h1>
      <div ref="mainfour" style="width: 110%; height: 300px"></div>
    </el-card>
    <el-card class="box-card box-card5">
      <h1>上周最受欢迎的5大作者</h1>
      <div ref="mainfive" style="width: 110%; height: 300px"></div>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "VisualData",
  mounted() {
    this.showLineone();
    this.showLinetwo();
    this.showPie();
    this.showBarone();
    this.showBartwo();
  },
  methods: {
    showLineone() {
      var myChart = this.$echarts.init(this.$refs.mainone);
      //  var myChart = echarts.init(document.getElementById('main'));

      // 绘制图表
      let option = {
        legend: {
          data: [
            "小说类",
            "文学类",
            "少儿类",
            "计算机类",
            "经济管理类",
            "科技科普类",
          ],
        },
        tooltip: {
          show: true,
          trigger: "axis",
        },
        xAxis: {
          data: [
            "星期一",
            "星期二",
            "星期三",
            "星期四",
            "星期五",
            "星期六",
            "星期天",
          ],
        },
        yAxis: {},
        series: [
          {
            data: [100, 222, 128, 143, 49, 34, 123],
            type: "line",
            name: "小说类",
          },
          {
            data: [75, 54, 23, 25, 10, 123, 12, 343],
            type: "line",
            name: "文学类",
          },
          {
            data: [35, 63, 213, 125, 132, 137, 122, 143],
            type: "line",
            name: "少儿类",
          },
          {
            data: [179, 214, 121, 135, 107, 113, 221, 43],
            type: "line",
            name: "计算机类",
          },
          {
            data: [223, 151, 231, 215, 101, 13, 112, 213],
            type: "line",
            name: "经济管理类",
          },
          {
            data: [175, 254, 213, 135, 120, 323, 92, 222],
            type: "line",
            name: "科技科普类",
          },
        ],
      };
      myChart.setOption(option);
    },
    showLinetwo() {
      var myChart = this.$echarts.init(this.$refs.maintwo);
      // 绘制图表
      let option = {
        legend: {
          data: [
            "小说类",
            "文学类",
            "少儿类",
            "计算机类",
            "经济管理类",
            "科技科普类",
          ],
        },
        tooltip: {
          show: true,
          trigger: "axis",
        },
        xAxis: {
          data: [
            "星期一",
            "星期二",
            "星期三",
            "星期四",
            "星期五",
            "星期六",
            "星期天",
          ],
        },
        yAxis: {},
        series: [
          {
            data: [120, 112, 328, 143, 249, 134, 113],
            type: "line",
            name: "小说类",
          },
          {
            data: [165, 154, 213, 215, 102, 183, 112, 143],
            type: "line",
            name: "文学类",
          },
          {
            data: [315, 263, 213, 125, 132, 127, 222, 143],
            type: "line",
            name: "少儿类",
          },
          {
            data: [279, 214, 121, 135, 107, 113, 221, 43],
            type: "line",
            name: "计算机类",
          },
          {
            data: [123, 151, 231, 215, 101, 13, 112, 213],
            type: "line",
            name: "经济管理类",
          },
          {
            data: [75, 254, 213, 135, 120, 323, 92, 222],
            type: "line",
            name: "科技科普类",
          },
        ],
      };
      myChart.setOption(option);
    },
    showPie() {
      var myChart = this.$echarts.init(this.$refs.mainthree);
      let option = {
        tooltip: {
          trigger: "item",
        },
        legend: {
          data: [
            "小说类",
            "文学类",
            "少儿类",
            "计算机类",
            "经济管理类",
            "科技科普类",
          ],
        },
        series: [
          {
            type: "pie",
            center: ["50%", "57%"],
            emphasis: {
              label: {
                show: true,
                fontSize: "40",
                fontWeight: "bold",
              },
            },
            labelLine: {
              show: false,
            },
            avoidLabelOverlap: false,
            itemStyle: {
              borderRadius: 10,
              borderColor: "#fff",
              borderWidth: 2,
            },
            label: {
              show: false,
              position: "center",
            },
            data: [
              {
                value: 22,
                name: "小说类",
              },
              {
                value: 21,
                name: "文学类",
              },
              {
                value: 11,
                name: "少儿类",
              },
              {
                value: 25,
                name: "计算机类",
              },
              {
                value: 9,
                name: "经济管理类",
              },
              {
                value: 12,
                name: "科技科普类",
              },
            ],
          },
        ],
      };

      myChart.setOption(option);
    },
    showBarone() {
      var myChart = this.$echarts.init(this.$refs.mainfive);
      let option = {
        xAxis: {
          type: "category",
          data: ["莫言", "余华", "巴金", "冰心", "柴静"],
        },
        yAxis: {
          type: "value",
        },
        tooltip: {
          show: true,
          trigger: "axis",
        },
        series: [
          {
            data: [
              120,
              {
                value: 200,
                itemStyle: {
                  color: "#a90000",
                },
              },
              150,
              80,
              70,
            ],
            type: "bar",
          },
        ],
      };
      myChart.setOption(option);
    },
    showBartwo() {
      var myChart = this.$echarts.init(this.$refs.mainfour);
      let option = {
        xAxis: {
          type: "category",
          data: ["活着", "看见", "繁星", "蛙", "呐喊"],
        },
        yAxis: {
          type: "value",
        },
        tooltip: {
          show: true,
          trigger: "axis",
        },
        series: [
          {
            data: [
              140,
              {
                value: 340,
                itemStyle: {
                  color: "#a90000",
                },
              },
              150,
              280,
              170,
            ],
            type: "bar",
          },
        ],
      };
      myChart.setOption(option);
    },
  },
};
</script>

<style>
.box-card {
  width: 480px;
}
.box-card1,
.box-card2 {
  width: 43%;
  height: 350px;
}
.box-card3,
.box-card4,
.box-card5 {
  width: 28%;
}
</style>