const app = require('./app');
const db =require('./config/db');
const userModel = require('./models/user.model');
const port = 3000;

app.get('/',(req,res)=>{

    res.send("hello World ")
});

app.listen(port,()=>{
// console.log('Server listing on port http://localhost:${port}');
console.log(`Server listing on port http://localhost:${port}`);

});