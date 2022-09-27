<template>
  <div class="thememessage">
    <el-button type="primary" @click="addTabledata">+加入一条新语句</el-button>
    <input
      type="text"
      placeholder="输入名字搜索"
      v-model="dataname"
      style="width: 260px; height: 26px; margin-left: 100px; margin-right: 5px"
    />
    <el-button type="primary" @click="searchData"
      ><i class="el-icon-search" style="font-size: 30px"></i
    ></el-button>

    <el-table
      :data="
        tableData.slice((currentPage - 1) * PageSize, currentPage * PageSize)
      "
      style="width: 100%"
    >
      <el-table-column label="编号" width="80" class="thememessage">
        <template slot-scope="scope">
          <i class="el-icon-time"></i>
          <span style="margin-left: 10px">{{ scope.row.id }}</span>
        </template>
      </el-table-column>
      <el-table-column label="书名" width="300">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p>编号: {{ scope.row.id }}</p>
            <p>书名: {{ scope.row.book_name }}</p>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.book_name }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column label="出版社" width="280">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p>编号: {{ scope.row.id }}</p>
            <p>出版社: {{ scope.row.book_press }}</p>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.book_press }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="类型" width="140">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p>编号: {{ scope.row.id }}</p>
            <p>类型: {{ scope.row.book_classify }}</p>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.book_classify }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column label="价格" width="80">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p>编号: {{ scope.row.id }}</p>
            <p>价格: {{ scope.row.book_price }}</p>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.book_price }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <el-table-column label="评分" width="80">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p>编号: {{ scope.row.id }}</p>
            <p>评分: {{ scope.row.book_score }}</p>
            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.book_score }}</el-tag>
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

    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="currentPage"
      :page-sizes="pageSizes"
      :page-size="PageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="tableData.length"
    >
    </el-pagination>

    <transition name="el-fade-in-linear">
      <el-form
        size="small"
        label-position="right"
        label-width="100px"
        :model="formLabelAlign"
        id="div_form"
        style="font-size: 26px"
        v-show="isForm"
        class="transition-box"
      >
        <br />
        <el-form-item label="编号">
          <el-input
            v-model="formLabelAlign.id"
            style="width: 70%; margin-right: 40px"
          ></el-input>
        </el-form-item>
        <el-form-item label="书名">
          <el-input
            v-model="formLabelAlign.book_name"
            style="width: 70%; margin-right: 40px"
          ></el-input>
        </el-form-item>
        <el-form-item label="出版社">
          <el-input
            v-model="formLabelAlign.book_press"
            style="width: 70%; margin-right: 40px"
          ></el-input>
        </el-form-item>
        <el-form-item label="类型">
          <el-input
            v-model="formLabelAlign.book_classify"
            style="width: 70%; margin-right: 40px"
          ></el-input>
        </el-form-item>
        <el-form-item label="价格">
          <el-input
            v-model="formLabelAlign.book_price"
            style="width: 70%; margin-right: 40px"
          ></el-input>
        </el-form-item>
        <el-form-item label="评分">
          <el-input
            v-model="formLabelAlign.book_score"
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
    </transition>
  </div>
</template>

<script>
export default {
  name: "BookMessageone",
  data() {
    return {
      dataname: "",
      isForm: false,
      isCj: true,
      formLabelAlign: {
        id: "",
        book_name: "",
        book_press: "",
        book_classify: "",
        book_price: "",
        book_score: "",
      },
      tableData: [
        {
          id: "1",
          book_name: "三案始末 影响大明王朝命运的三大谜案",
          book_press: "生活.读书.新知三联书店",
          book_classify: "历史",
          book_price: 24.0,
          book_score: 2.4,
        },
        {
          id: "2",
          book_name: "《史记》讲义+《史记》中的宴会",
          book_press: "线装书局",
          book_classify: "历史",
          book_price: 123,
          book_score: 3.4,
        },
        {
          id: "3",
          book_name: "DK世界家具大百科：从古典到当代",
          book_press: "华夏出版社",
          book_classify: "艺术",
          book_price: 299,
          book_score: 4.4,
        },

        {
          id: "4",
          book_name: "薄世宁医学通识讲义 2019年度中国好书'",
          book_press: "中信出版社",
          book_classify: "当当保健/养生畅销榜",
          book_price: 33.2,
          book_score: 2.5,
        },
        {
          id: "5",
          book_name: "中西印哲学导论",
          book_press: "北京大学出版社",
          book_classify: "哲学",
          book_price: 63.9,
          book_score: 3.4,
        },
        {
          id: "6",
          book_name: "人间好玩",
          book_press: "湖南文艺出版社",
          book_classify: "文学",
          book_price: 22,
          book_score: 4.1,
        },

        {
          id: "7",
          book_name: "你想过怎样的一生？",
          book_press: "北京联合出版有限公司",
          book_classify: "励志畅销榜",
          book_price: 88.5,
          book_score: 4.2,
        },

        {
          id: "8",
          book_name: "你缺的不是努力，而是变现的能力：用准确努力撬动财富自由",
          book_press: "中国友谊出版公司",
          book_classify: "励志畅销榜",
          book_price: 22.4,
          book_score: 3.5,
        },

        {
          id: "9",
          book_name: "偏偏宠爱",
          book_press: "青岛出版社",
          book_classify: "青春文学",
          book_price: 38.9,
          book_score: 3.8,
        },

        {
          id: "10",
          book_name: "十年一品温如言",
          book_press: "百花洲文艺出版社",
          book_classify: "青春文学",
          book_price: 64,
          book_score: 2.5,
        },

        {
          id: "11",
          book_name: "南明史",
          book_press: "北京日报出版社",
          book_classify: "历史",
          book_price: 169,
          book_score: 3.5,
        },

        {
          id: "12",
          book_name: "学习天性",
          book_press: "中国友谊出版公司",
          book_classify: "励志畅销榜",
          book_price: 39.6,
          book_score: 1.1,
        },

        {
          id: "13",
          book_name: "打开心智",
          book_press: "中国友谊出版公司",
          book_classify: "励志畅销榜",
          book_price: 39,
          book_score: 3.4,
        },

        {
          id: "14",
          book_name: "春天，我想去田野里采一朵花",
          book_press: "北京联合出版有限公司",
          book_classify: "文学",
          book_price: 44,
          book_score: 2.3,
        },

        {
          id: "15",
          book_name: "桃枝气泡",
          book_press: "百花洲文艺出版社",
          book_classify: "青春文学",
          book_price: 24.9,
          book_score: 3.5,
        },

        {
          id: "16",
          book_name: "活着",
          book_press: "北京大学出版社",
          book_classify: "文学",
          book_price: 54.8,
          book_score: 4.9,
        },

        {
          id: "17",
          book_name: "海棠微雨共归途2",
          book_press: "广东旅游出版社",
          book_classify: "青春文学",
          book_price: 36.5,
          book_score: 4.7,
        },

        {
          id: "18",
          book_name: "玫瑰予秃鹫",
          book_press: "西安出版社",
          book_classify: "青春文学",
          book_price: 22.5,
          book_score: 4.1,
        },

        {
          id: "19",
          book_name: "白桃乌龙",
          book_press: "江苏凤凰文艺出版社",
          book_classify: "青春文学",
          book_price: 34.9,
          book_score: 4.1,
        },

        {
          id: "20",
          book_name: "神经网络与深度学习",
          book_press: "机械工业出版社",
          book_classify: "计算机",
          book_price: 73,
          book_score: 4.3,
        },

        {
          id: "21",
          book_name: "罗马的胜利",
          book_press: "天津人民出版社",
          book_classify: "历史",
          book_price: 24,
          book_score: 2.8,
        },

        {
          id: "22",
          book_name: "阅读的方法",
          book_press: "新星出版社",
          book_classify: "励志畅销榜",
          book_price: 43.1,
          book_score: 2.3,
        },
      ],
      // 默认显示第几页
      currentPage: 1,
      // 总条数，根据接口获取数据长度(注意：这里不能为空)

      // 个数选择器（可修改）
      pageSizes: [5, 10, 20],
      // 默认每页显示的条数（可修改）
      PageSize: 10,
    };
  },
  methods: {
    // 分页
    // 每页显示的条数
    handleSizeChange(val) {
      // 改变每页显示的条数
      this.PageSize = val;
      // 注意：在改变每页显示的条数时，要将页码显示到第一页
      this.currentPage = 1;
    },
    // 显示第几页
    handleCurrentChange(val) {
      // 改变默认的页数
      this.currentPage = val;
    },

    submitForm() {
      this.isForm = false;
      this.tableData[this.index].id = this.formLabelAlign.id;
      this.tableData[this.index].book_name = this.formLabelAlign.book_name;
      this.tableData[this.index].book_press = this.formLabelAlign.book_press;
      this.tableData[this.index].book_classify =
        this.formLabelAlign.book_classify;
      this.tableData[this.index].book_price = this.formLabelAlign.book_price;
      this.tableData[this.index].book_score = this.formLabelAlign.book_score;
      console.log("立刻修改", this.formLabelAlign);
      console.log(
        this.index,
        "----------------",
        this.formLabelAlign.book_press
      );
    },
    addTabledata() {
      this.formLabelAlign.id = "";
      this.formLabelAlign.book_name = "";
      this.formLabelAlign.book_press = "";
      this.formLabelAlign.book_classify = "";
      this.formLabelAlign.book_price = "";
      this.formLabelAlign.book_score = "";
      this.isForm = true;
      this.isCj = true;
    },
    addData() {
      this.tableData.unshift(this.formLabelAlign);
      this.isForm = false;
    },
    resetForm() {
      this.isForm = false;
      console.log("取消");
    },
    // 搜索
    searchData() {
      this.tableData = this.tableData.filter(
        (t) => t.book_name == this.dataname
      );

      console.log(this.tableData);
      // this.dataname = "";
    },
    handleEdit(index, row) {
      this.isCj = !this.isCj;
      this.index = index;
      this.isForm = true;
      this.formLabelAlign.id = row.id;
      this.formLabelAlign.book_name = row.book_name;
      this.formLabelAlign.book_press = row.book_press;
      this.formLabelAlign.book_classify = row.book_classify;
      this.formLabelAlign.book_price = row.book_price;
      this.formLabelAlign.book_score = row.book_score;
      console.log(index, row);
    },
    handleDelete(index, row) {
      console.log(index, row);
      this.tableData = this.tableData.filter((t) => t.id != row.id);
    },
  },

  mounted() {
    this.total = this.tableData.length;
    console.log("this.tableData.lenght:", this.tableData.length);
  },
};
</script>
<style lang="less" scoped>
#div_form {
  position: absolute;
  top: 200px;
  left: 570px;
  width: 30%;
  height: 60%;
  background-image: url("../../assets/ts.jpg");
  background-size: 68%;
  z-index: 50;
}
.transition-box {
  margin-bottom: 10px;
  width: 200px;
  height: 100px;
  border-radius: 4px;
  background-color: whitesmoke;
  text-align: center;
  color: #fff;
  padding: 40px 20px;
  box-sizing: border-box;
  margin-right: 20px;
}
</style>









