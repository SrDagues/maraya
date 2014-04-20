package maraya.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import maraya.entity.Especializaciones;
import maraya.entity.Gruposmedicos;
import maraya.entity.RegistroHistorial;
import maraya.entity.UsuariosMedicos;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-04-19T02:28:40")
@StaticMetamodel(Medicos.class)
public class Medicos_ { 

    public static volatile SingularAttribute<Medicos, String> nombre;
    public static volatile CollectionAttribute<Medicos, RegistroHistorial> registroHistorialCollection;
    public static volatile SingularAttribute<Medicos, String> apellidos;
    public static volatile CollectionAttribute<Medicos, Gruposmedicos> gruposmedicosCollection;
    public static volatile SingularAttribute<Medicos, String> nColegiado;
    public static volatile SingularAttribute<Medicos, String> dni;
    public static volatile CollectionAttribute<Medicos, UsuariosMedicos> usuariosMedicosCollection;
    public static volatile SingularAttribute<Medicos, Especializaciones> especializacion;

}