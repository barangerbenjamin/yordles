// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  let keyListener = function (keyEvent){
    let emptyWord = document.querySelector(".empty");
    let wordLetters = Array.from(emptyWord.children).map(letter => letter.innerText);
    let index = wordLetters.indexOf("");
    let temporaryLetters = wordLetters.filter(w => w !== "")
    if (temporaryLetters.length === 4) {
      document.querySelector(".word.active").classList.add('enter')
    }

    if ((keyEvent.keyCode >= 65 && keyEvent.keyCode <= 90) || keyEvent.key === "Backspace" ) {
      if (keyEvent.key === "Backspace") {
        let enterPrompt = document.querySelector(".word.active.enter")
        if (enterPrompt) {
          enterPrompt.classList.remove('enter')
        }
        let poppeds = document.querySelectorAll('.popped')
        if (poppeds.length > 0) {
          poppeds[poppeds.length -1].classList.remove('popped')
        }

        if (temporaryLetters.length > 0) {
          let indexLastTypedLetter = temporaryLetters.length - 1
          emptyWord.children[indexLastTypedLetter].style.backgroundColor = 'grey'
          emptyWord.children[indexLastTypedLetter].innerText = "";
        }
      } else {
        if (index >= 0) {
          let keyboardKey = document.querySelector(`.keyboard-btn.${keyEvent.key.toLowerCase()}`)
          keyboardKey.classList.add('keyboard-popped')
          setTimeout(() => {
            keyboardKey.classList.remove('keyboard-popped') // allow to retrigger animation if keyboard tile clicked multiple times
          }, 300);
          emptyWord.children[index].style.backgroundColor = '#3a3a3c'
          emptyWord.children[index].classList.add('popped')
          emptyWord.children[index].innerText = keyEvent.key.toUpperCase();
        }
      }
    } else if (keyEvent.key === "Enter" && temporaryLetters.length === 5) {
      let form = document.querySelector("form");
      let input = document.querySelector("#attempt_words");
      let existingAttempts = JSON.parse(document.querySelector(".attempt").dataset.attempts);
      let attempt = Array.from(emptyWord.children).map(letter => letter.innerText).filter(w => w !== "").join('')
      existingAttempts.push(attempt);
      input.value = existingAttempts;
      document.querySelector(".form-submit").click();
    }
  }

  let keyboardListener = () => {
    document.querySelectorAll(".keyboard-btn").forEach(button => {
      button.addEventListener("click", (event) => {
        let keyHash = {
          'keyCode': button.dataset.key.toUpperCase().charCodeAt(0),
          'key': button.dataset.key.toUpperCase()
        }
  
        if (button.dataset.key === '←') {
          keyHash = { 'keyCode': 8, 'key': 'Backspace' }
        } else if (button.dataset.key === '↵') {
          keyHash = { 'keyCode': 13, 'key': 'Enter' }
        }
  
        document.dispatchEvent(new KeyboardEvent('keydown', keyHash));
      });
    });
  }
  keyboardListener();
  

  if(!document.querySelector(".attempt").dataset.finished) {
    document.addEventListener("keydown", (event) => {
      keyListener(event)
    })
  }
});
