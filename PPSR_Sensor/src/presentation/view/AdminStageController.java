package presentation.view;

import java.io.IOException;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;

/**
 * 
 * @author PPSR
 *
 */

public class AdminStageController {

	/**
	 * String schermata nuovo cliente
	 */
	public static final String NUOVO_CLIENTE;
	/**
	 * String schermata elimina cliente
	 */
	public static final String ELIMINA_CLIENTE;
	/**
	 * String schermata lista sensori
	 */
	public static final String LISTA_SENSORI;
	/**
	 * String schermata lista impianti
	 */
	public static final String LISTA_IMPIANTI;
	/**
	 * String schermata nuovo impianto
	 */
	public static final String NUOVO_IMPIANTO;
	/**
	 * String schermata lista clienti
	 */
	public static final String LISTA_CLIENTI;
	/**
	 * String schermata modifica impianto
	 */
	public static final String MODIFICA_IMPIANTO;
	/**
	 * String schermata aggiorna database
	 */
	public static final String AGGIORNA_DB;

	static {
		NUOVO_CLIENTE = "presentation/view/NuovoCliente.fxml";
		ELIMINA_CLIENTE = "presentation/view/EliminaCliente.fxml";
		LISTA_SENSORI = "presentation/view/ListaSensori.fxml";
		LISTA_IMPIANTI = "presentation/view/ListaImpianti.fxml";
		NUOVO_IMPIANTO = "presentation/view/NuovoImpianto.fxml";
		LISTA_CLIENTI = "presentation/view/ListaClienti.fxml";
		MODIFICA_IMPIANTO = "presentation/view/ListaSensoriModifica.fxml";
		AGGIORNA_DB = "presentation/view/ListaModelli.fxml";

	}
	/**
	 * 1 se mostra sensori, 2 se crea impianto, 3 se elimina impianto, 4
	 * modifica impianto, elimina cliente 5
	 */
	public static int funzione = 0;

	@FXML
	private AnchorPane content;
	@FXML
	private Button homeButton;
	@FXML
	private Button nuovoClienteButt;
	@FXML
	private Button eliminaClienteButt;

	@FXML
	private Button listaClienteButt;
	@FXML
	private Button nuovoImpiantoButt;
	@FXML
	private Button eliminaImpiantoButt;
	@FXML
	private Button modificaImpiantoButt;
	@FXML
	private Button aggiornaDBButt;

	AnchorPane newLoadedPane;

	@FXML
	public void initialize() {

		homeButton.setOnAction((event) -> {
			funzione = 1;
			goScene(LISTA_IMPIANTI);
		});

		nuovoClienteButt.setOnAction((event) -> {
			goScene(NUOVO_CLIENTE);
		});
		listaClienteButt.setOnAction((event) -> {
			goScene(LISTA_CLIENTI);
		});

		eliminaClienteButt.setOnAction((event) -> {
			funzione = 5;
			goScene(LISTA_CLIENTI);// APRE LISTA CLIENTI
		});

		nuovoImpiantoButt.setOnAction((event) -> {
			funzione = 2;
			goScene(LISTA_CLIENTI);
		});

		eliminaImpiantoButt.setOnAction((event) -> {
			funzione = 3;
			goScene(LISTA_CLIENTI);
		});

		modificaImpiantoButt.setOnAction((event) -> {
			funzione = 4;
			goScene(LISTA_CLIENTI);
		});

		aggiornaDBButt.setOnAction((event) -> {
			goScene(AGGIORNA_DB);
		});

	}

	public void goScene(String scene) {
		System.out.println("Andrea Past " + scene);
		try {
			newLoadedPane = FXMLLoader.load(getClass().getClassLoader().getResource(scene));
			content.getChildren().clear();
			content.getChildren().add(newLoadedPane);
		} catch (IOException e) {
			System.out.println("Fallito carricamento schermata!");
			// e.printStackTrace();
		}
	}

}