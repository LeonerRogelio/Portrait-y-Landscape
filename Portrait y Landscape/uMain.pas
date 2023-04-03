unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Platform;

type
  TfrmMain = class(TForm)
    pnlHeader: TPanel;
    Rectangle1: TRectangle;
    lblMain: TLabel;
    pnlImages: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.FormResize(Sender: TObject);
var
  w, h: single;
var
  s: IFMXScreenService;
begin
  // verificar si hubo un cambio de orientación
  if self.Width > self.Height then
  begin
    // hubo un cambio de orientación a LandScape
    // orientar el panel 1 a la izquierda
    // el panel 2 se ajustará a lo que quede de espacio (Client)
    // dividir el ancho del panel de imagenes en 2 para
    // ajustar el tamaño de ambas imagenes a través de los paneles
    w := pnlImages.Width / 2;
    Panel1.Align := TAlignLayout.Left;
    Panel1.Width := w;
  end
  else if self.Height > self.Width then
  begin
    // hubo un cambio de orientación a Portrait
    // orientar el panel 1 al Tope
    // el panel 2 se ajustará a lo que quede de espacio (Client)
    h := pnlImages.Height / 2;
    Panel1.Align := TAlignLayout.Top;
    Panel1.Height := h;
  end;

  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, s)
  then
  begin
    case s.GetScreenOrientation of
      TScreenOrientation.Portrait:
        lblMain.Text := 'Portrait Orientation';
      TScreenOrientation.Landscape:
        lblMain.Text := 'Landscape Orientation';
      TScreenOrientation.InvertedPortrait:
        lblMain.Text := 'InvertedPortrait Orientation';
      TScreenOrientation.InvertedLandscape:
        lblMain.Text := 'InvertedLandscape Orientation';
    end;
  end;

end;

end.
