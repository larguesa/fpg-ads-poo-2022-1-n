/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package demo;

/**
 *
 * @author rlarg
 */
public class Data {
    private int dia;
    private int mês;
    private int ano;
    //Construtores
    public Data(){//sem parâmetro
        this.dia=1; this.mês=1; this.ano=2000;
    }
    public Data(int dia, int mês, int ano) {//parametrizado
        this.dia = dia;
        this.mês = mês;
        this.ano = ano;
    }
    
    public String getData(){
        return getAniversário()+"/"+ano;
    }
    public String getAniversário(){
        return dia+"/"+mês;
    }
    
    /**
     * Método para atribuir a data de uma vez e economizar seu tempo
     * @param dia - dia da data
     * @param mês - mês da data
     * @param ano - ano adivinha do que?
     */
    public void setData(int dia, int mês, int ano){
        this.dia = dia;
        this.mês = mês;
        this.ano = ano;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getMês() {
        return mês;
    }

    public void setMês(int mês) {
        this.mês = mês;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }
    
}