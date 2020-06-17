const host = 'localhost';
const user = 'root';
const password = 'RooT1234';
const database = 'web_prog'; // Note! You need called DB like that

const Importer = require('mysql-import');
const importer = new Importer({ host, user, password });

importer.import('./dump/Dump20200617.sql').then(()=>{
  var files_imported = importer.getImported();
  console.log('${files_imported.length} SQL file(s) imported.');
}).catch(err=>{
  console.error(err);
});