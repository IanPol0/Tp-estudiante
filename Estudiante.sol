// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante
{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private notas_materias;
    string[] private keys;

    constructor(string memory nombre_, string memory apellido_, string memory curso_)
    {
        _nombre = nombre_;
        _apellido= apellido_;
        _curso= curso_;
        _docente = msg.sender;
    }

    function apellido() public view returns(string memory)
    {
        return _apellido;
    }

    function nombre_completo() public view returns(string memory)
    {
        return string(abi.encodePacked(_nombre, ' ', _apellido));
    }

    function curso() public view returns(string memory)
    {
        return _curso;
    }

    function set_nota_materia(uint nota, string memory materia) public
    {
        if(_docente == msg.sender && nota <=10 && nota >= 1)
        {
            notas_materias[materia] = nota;

            keys.push(materia);
        }
    }

    function nota_materia(string memory materia) public view returns(uint)
    {
        return notas_materias[materia];
    }

    function aprobo(string memory materia) public view returns(bool)
    {
        return notas_materias[materia] >= 6;
    }

    function promedio() public view returns(uint)
    {
        uint valores_totales = 0;

        for(uint i = 0; i < keys.length; i++)
        {
            valores_totales = valores_totales + notas_materias[keys[i]];
        }

        return valores_totales / keys.length;
    }


}