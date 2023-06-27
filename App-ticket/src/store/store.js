import { createStore } from 'vuex';

export default createStore({
  state() {
    return {
      cliente: null,
      cd: null
    };
  },
  mutations: {
    setCliente(state, cliente) {
      state.cliente = cliente;
    },
    setCd(state, cd) {
      state.cd = cd;
    }
  },
  actions: {
    setCliente({ commit }, cliente) {
      commit('setCliente', cliente);
    },
    setCd({ commit }, cd) {
      commit('setCd', cd);
    }
  },
  getters: {
    getCliente(state) {
      return state.cliente;
    },
    getCd(state) {
      return state.cd;
    }
  }
});
