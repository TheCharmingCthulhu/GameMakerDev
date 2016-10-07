using UnityEngine;
using System.Collections;

public class Tetromino : MonoBehaviour {

	public enum TetrominoType{
		I, L, O, T, Z 
	}

	public bool Rotation = true;
	public bool Frozen = false;
	public TetrominoType Type;

	float _delay = 0.05f, _delayDelta = 0.05f; // Each 1/9 of a second...
	float _time = 0.5f, _timeDelta = 0.5f; // Each second...

	// Use this for initialization
	void Start () {
	
		if (Collision ()) {
			GetComponentInParent<Gamemaster> ().DisplayGameover ();

			DestroyObject (this);
		}
	}

	void Move(int x, int y){
		transform.position = new Vector2 (transform.position.x + x, transform.position.y + y);
	}

	void Rotate(){
		transform.Rotate (Vector3.forward * 90);
	}

	void AntiClockwiseRotate(){
		transform.Rotate (Vector3.forward * -90);
	}

	bool Collision(){
		for (int i = 0; i < transform.childCount; i++) {
			var child = transform.GetChild (i);
			if (!GetComponentInParent<Gamemaster> ().IsFree (child.position.x, child.position.y))
				return true;
		}

		return false;
	}

	// Update is called once per frame
	void Update () {
		UpdateInput ();
		UpdateMovement ();
	}

	void UpdateInput(){

		if (!Frozen) {
			if (Rotation) {
				if (Input.GetKeyDown (KeyCode.UpArrow)) {
					Rotate ();

					if (Collision ())
						AntiClockwiseRotate ();
				}
			}

			if (_delay < 0) {
				if (Input.GetKey (KeyCode.LeftArrow)) {
					Move (-1, 0);
			
					if (Collision ())
						Move (1, 0);
				}

				if (Input.GetKey (KeyCode.RightArrow)) {
					Move (1, 0);
			
					if (Collision ())
						Move (-1, 0);
				}

				if (Input.GetKey (KeyCode.DownArrow)) {
					Move (0, -1);

					if (Collision ())
						Move (0, 1);
				}
		
				_delay = _delayDelta;
			}

			_delay -= Time.deltaTime;
		}
	}

	void UpdateMovement(){
		if (!Frozen) {
			if (_time < 0) {

				Move (0, -1);

				if (Collision ()) {
					Move (0, 1);
					Frozen = true;

					GetComponentInParent<Gamemaster> ().SpawnTetromino ();
					GetComponentInParent<Gamemaster> ().InsertTetromino (transform);
				}

				_time = _timeDelta;
			}

			_time -= Time.deltaTime;
		}
	}
}
