let becomecollapse = {
    namespaced: true,
    mutations: {
        BECOMECOLLAPSE(miniState) {
            miniState.collapse = !miniState.collapse
            console.log("到了！", miniState.collapse)
        }
    },
    state: {
        collapse: false
    }
}
export default becomecollapse