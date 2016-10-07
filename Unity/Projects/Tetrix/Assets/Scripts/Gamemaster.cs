using UnityEngine;
using System.Collections;

public class Gamemaster : MonoBehaviour {

	public int Width;
	public int Height;

	public GameObject Wall;
	public GameObject[] Tetrominos;

	public GameObject[] UI;

	Vector2 _Spawn;
	GameObject _Tetromino;
	Transform[,] _Grid;

	float _time = 0.2f, _timeDelta = 0.2f;

	// Use this for initialization
	void Start () {
		InitializeGrid ();

		SpawnTetromino ();

		Camera.main.transform.position = new Vector3 ((float)(Width - 1) / 2, (float)(Height - 1) / 2, -10);
	}

	// Grid methods...
	void InitializeGrid(){
		_Grid = new Transform[Width, Height + 1];

		for (int x = 0; x < Width; x++)
			for (int y = 0; y < Height; y++) {
				if (Wall != null)
				if (x == 0 || x == Width - 1 || y == 0) {
					var wall = Instantiate (Wall, new Vector2 (x, y), Quaternion.identity) as GameObject;

					_Grid [x, y] = wall.transform;
				}
			}

		_Spawn = new Vector2 (Width / 2, Height - 2);
	}

	bool IsLineComplete(int y){
		for (int x = 1; x < Width - 1; x++)
			if (_Grid [x, y] == null)
				return false;

		return true;
	}

	void DestroyLine(int y){
		for (int x = 1; x < Width - 1; x++)
			if (_Grid[x, y] != null)
			{
				DestroyObject (_Grid [x, y].gameObject);

				_Grid [x, y] = null;
			} 

		FlushLines (y + 1);
	}

	void FlushLines(int y){
		for (int yy = y; yy < Height - 3; yy++)
			for(int x = 1; x < Width - 1; x++)
				if (_Grid[x, yy] != null){
					var transform = _Grid [x, yy];
					transform.position = new Vector2 (transform.position.x, transform.position.y - 1);

					_Grid [x, yy] = null;
					_Grid [x, yy - 1] = transform;
				}
	}

	// Internal methods for outside use...
	internal void SpawnTetromino(){
		if (Tetrominos.Length > 0) {
			_Tetromino = Instantiate (Tetrominos [Random.Range (0, Tetrominos.Length - 1)], new Vector3 (_Spawn.x, _Spawn.y, 0), Quaternion.identity) as GameObject;
			_Tetromino.transform.parent = transform;

			switch (_Tetromino.GetComponent<Tetromino> ().Type) {
			case Tetromino.TetrominoType.O:
				_Tetromino.GetComponent<Tetromino> ().Rotation = false;
				break;
			}
		}
	}

	internal void InsertTetromino(Transform transform){

		for(int i = 0; i < transform.childCount; i++){
			var child = transform.GetChild (i);

			_Grid [Mathf.RoundToInt (child.position.x), Mathf.RoundToInt (child.position.y)] = child;
		}
	}
		
	internal bool IsFree(float x, float y){
		return _Grid [Mathf.RoundToInt(x), Mathf.RoundToInt(y)] == null;
	}

	internal void DisplayGameover(){
		UI [0].SetActive (true);
	}
	
	// Update is called once per frame
	void Update () {
		UpdateGrid ();
		UpdateHotkeys ();
	}

	void UpdateGrid(){
		if (_time < 0){

			for (int y = 1; y < Height; y++)
				if (IsLineComplete (y))
					DestroyLine (y);

			_time = _timeDelta;
		}

		_time -= Time.deltaTime;
	}

	void UpdateHotkeys(){
		if (Input.GetKey (KeyCode.Escape))
			Application.Quit();
	}

	// Gizmos
	void OnDrawGizmos(){
		DrawGrid ();
	}

	void DrawGrid(){
		for (int x = 0; x < Width; x++)
			for (int y = 0; y < Height; y++) {
				if (_Grid != null && _Grid [x, y] != null) {
					Gizmos.color = Color.red;
					Gizmos.DrawCube (new Vector2 (x, y), new Vector2 (1, 1));
				} else {
					Gizmos.color = Color.white;
					Gizmos.DrawWireCube (new Vector2 (x, y), new Vector2 (1, 1));
				}
			}
	}
}
