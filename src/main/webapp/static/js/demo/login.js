// account test
const userTest = {
    email: 'user@gmail.com',
    password: '123'
}

window.onload = () =>{
    document.getElementById('form-login').addEventListener('submit', (event) => {
        event.preventDefault();
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const user = {
            email: email,
            password: password
        };
        

        if(email === userTest.email && password === userTest.password){
            localStorage.setItem('user', JSON.stringify(user));
            window.location.href = 'home.html';
        }else{
           const message = document.getElementById('message');
           message.hidden = false;
              message.innerHTML = 'Email hoặc mật khẩu không chính xác!';
        }
    });
    
}