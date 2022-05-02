/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author rlarg
 */
public class Pessoa {
    private String nome;
    private String cpf;
    private Pessoa pai;
    private Pessoa mãe;
    private Date nascimento;
    
    public Integer getIdade(){
        if(nascimento==null) return null;
        Calendar hoje = Calendar.getInstance();
        Calendar nasc = Calendar.getInstance();
        nasc.setTime(nascimento);
        int anoAtual = hoje.get(Calendar.YEAR);
        int anoDeNascimento = nasc.get(Calendar.YEAR);
        return anoAtual - anoDeNascimento;
    }
    
    public Pessoa getAvôPaterno(){
        if(pai==null) return null;
        return pai.getPai();
    }
    public Pessoa getAvóPaterna(){
        if(pai==null) return null;
        return pai.getMãe();
    }
    public Pessoa getAvôMaterno(){
        if(mãe==null) return null;
        return mãe.getPai();
    }
    public Pessoa getAvóMaterna(){
        if(mãe==null) return null;
        return mãe.getMãe();
    }
    
    public Pessoa(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Pessoa getPai() {
        return pai;
    }

    public void setPai(Pessoa pai) {
        this.pai = pai;
    }

    public Pessoa getMãe() {
        return mãe;
    }

    public void setMãe(Pessoa mãe) {
        this.mãe = mãe;
    }

    public Date getNascimento() {
        return nascimento;
    }

    public void setNascimento(Date nascimento) {
        this.nascimento = nascimento;
    }
    
}