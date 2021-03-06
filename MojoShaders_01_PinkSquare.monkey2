#Import "<std>"
#Import "<mojo>"
#Import "shaders/test01_pink.glsl"

Using std..
Using mojo..

'In this example, the shader simply returns a pink color.
'"canvas.Color" would be ignored!

Class MyWindow Extends Window
	
	Field img :Image
	Field testShader :Shader

	Method New()
		Super.New( "Shader test",1024,600,WindowFlags.Resizable  )
		
		Local testShader := New Shader( "test01", LoadString("asset::test01_pink.glsl"), "" )
		img = New Image( 512, 512, TextureFlags.FilterMipmap, testShader )
		img.Handle = New Vec2f( 0.5 )
	End

	Method OnRender( canvas:Canvas ) Override
		App.RequestRender()
		canvas.DrawImage( img, Width/2, Height/2 )
	End
	
End

Function Main()
	New AppInstance
	New MyWindow
	App.Run()
End
