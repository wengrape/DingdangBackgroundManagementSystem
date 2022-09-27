
// 获取数据
function getData(u) {
    let that = this;
    // 发出请求
    this.$axios({
        method: "get",
        url: u,
    })
        .then(function (response) {
            // response.data.pipe(fs.createWriteStream("ada_lovelace.jpg"));

            that.$store.state.booklending = response.data;
            console.log(response);
        })
        .catch(function (error) {
            console.log(error);
        });

    console.log(
        "this.$store.state.booklending:",
        this.$store.state.booklending
    );

}

export { getData }

