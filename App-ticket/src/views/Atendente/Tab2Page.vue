<template>
  <ion-page>
    <ion-content :fullscreen="true">
      <div class="form row">
        <div class="form-container">
            <form @submit="submitForm">
                {{ resposta }}
                <ion-item>
                    <ion-input label="Nome: " v-model="nome" type="text" required></ion-input>
                </ion-item>
                <ion-item>
                    <ion-input label="Cpf: " v-model="cpf" type="text" required></ion-input>
                </ion-item>
                <ion-item>
                    <ion-input label="Email: " v-model="email" type="text" required></ion-input>
                </ion-item>
                <ion-item>
                    <ion-input label="senha: " v-model="senha" type="password" required></ion-input>
                </ion-item>
                <br>
                <ion-button expand="full" type="submit" >Cadastrar</ion-button>
            </form>
        </div>
      </div>
    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonInput, IonLabel, IonItem, IonButton } from '@ionic/vue';
import axios from 'axios';

export default {
    components: { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonInput, IonLabel, IonItem, IonButton },
 data() {
    return {
        nome: '',
        email: '',
        senha: '',
        cpf: '',
        resposta: '',
        page: false
    }
 },
 mounted() {
        window.history.replaceState({}, document.title, window.location.pathname);
        },
 methods: {
    async submitForm(event) {
      event.preventDefault(); // Evita o comportamento padrão do envio do formulário

      const formData = new FormData();
      formData.append('nome', this.nome);
      formData.append('email', this.email);
      formData.append('senha', this.senha);
      formData.append('cpf', this.cpf);

      try {
        const response = await axios.post('http://localhost/Api-banco/CadasT.php', formData);
        this.resposta = response.data.message;
        this.nome = '';
        this.email = '';
        this.senha = '';
        this.cpf = '';
        // Trate a resposta da API conforme necessário
      } catch (error) {
        console.error(error);
      }
    },
 }
}
</script>

<style scoped>
.form {
  --padding-top: 30px;
}
</style>