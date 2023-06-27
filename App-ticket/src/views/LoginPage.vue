<template>
  <ion-page>
    <ion-header>
        <ion-toolbar>
            <img style="height: 59px; width: auto;" src="../img/logodrc.png">
        </ion-toolbar>
      </ion-header>
    <ion-content :fullscreen="true">
        <div class="form row" >
            <div class="form-container">
                {{resposta}}
                <form @submit="submitForm">
                <ion-item>
                    <ion-input label="Email" v-model="email" type="text" required></ion-input>
                </ion-item>
                <ion-item>
                    <ion-input label="senha" v-model="senha" type="password" required></ion-input>
                </ion-item>
                <br>
                <ion-grid>
                    <ion-row>
                        <ion-col>
                            <ion-radio-group v-model="tipo" allow-empty-selection="true" value="turtles">
                                <ion-radio value="integrante" style="right: 16px;">Integrante</ion-radio>
                                <ion-radio value="atendente">Atendente</ion-radio>
                            </ion-radio-group>
                        </ion-col>
                    </ion-row>
                </ion-grid>
                <br>
                <ion-button expand="full" type="submit">Entrar</ion-button>
                </form>
            </div>
        </div>
    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonRow, IonGrid, IonItem, IonInput, IonButton, IonRadio, IonRadioGroup, IonCol } from '@ionic/vue';
import axios from 'axios';

export default {
    components: { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonRow, IonGrid, IonItem, IonInput, IonButton, IonRadio, IonRadioGroup, IonCol },
    data() {
    return {
      email: '',
      senha: '',
      resposta: '',
      page: true,
      tipo: 'integrante',
      
    };
  },
  mounted() {
    window.history.replaceState({}, document.title, window.location.pathname);
  },
  methods: {
    async submitForm(event) {
      event.preventDefault(); // Evita o comportamento padrão do envio do formulário

      const formData = new FormData();
      formData.append('email', this.email);
      formData.append('senha', this.senha);
      formData.append('tipo' , this.tipo);

      try {
            if(this.tipo == 'integrante') {
                const response = await axios.post('http://localhost/Api-banco/loginC.php', formData);
                if (response.data.success) {
                // Redireciona para a página de sucesso (por exemplo, página inicial do aplicativo)
                this.$router.replace('/tabsC/');
                this.resposta = response.data.message;
                this.$store.dispatch('setCliente', response.data.cd_integrantes);
                } else {
                // Lida com a resposta de erro do backend (por exemplo, exibe uma mensagem de erro)
                this.resposta = response.data.message;
                console.log(response.data.message);
                }
              } else {
              const response = await axios.post('http://localhost/Api-banco/loginT.php', formData);
              if (response.data.success) {
              // Redireciona para a página de sucesso (por exemplo, página inicial do aplicativo)
              this.$router.replace('/tabsT/');
              this.resposta = response.data.message;
              this.$store.dispatch('setCliente', response.data.cd_atendente);
          

              } else {
              // Lida com a resposta de erro do backend (por exemplo, exibe uma mensagem de erro)
              this.resposta = response.data.message;
              console.log(response.data.message);
              }
          }
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>

<style scoped>
ion-grid {
    align-items: center;
    text-align: center;
    align-content: center;
}
</style>