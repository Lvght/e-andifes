import { Avatar, Badge, Button, CounterBadge, Divider, Label, makeStyles, Popover, PopoverSurface, PopoverTrigger, shorthands, Tab, TabList } from '@fluentui/react-components';

import {
  DrawerBody,
  DrawerHeader,
  DrawerHeaderTitle,
  Drawer,
  DrawerProps,
  DrawerInline,
} from "@fluentui/react-components/unstable";

import * as Icons from '@fluentui/react-icons'
import * as React from 'react';

const useStyles = makeStyles({
  root: {
    ...shorthands.overflow("hidden"),
    display: "flex",
    height: "480px",
    backgroundColor: "#fff",
  },

  content: {
    ...shorthands.flex(1),
    ...shorthands.padding("16px"),
    display: "flex",
    justifyContent: "center",
    alignItems: "flex-start",
  },
});

function LandingPage() {
  const styles = useStyles();

  return (
    <div>
      <TabList defaultSelectedValue="tab1">
        <Tab value="tab0" icon={<Icons.New20Filled />}>
          Novidades
          <div style={{ display: "inline-block", width: "4px" }} />
          <Badge appearance="filled" size="small">99+</Badge>
        </Tab>
        <Tab value="tab1" icon={<Icons.Home20Filled />}>Página inicial</Tab>
        <Tab value="tab2" icon={<Icons.Calendar20Filled />}>Agenda</Tab>
        <Tab value="tab3" icon={<Icons.Document16Filled />}>Editais</Tab>
        <Tab value="tab4" icon={<Icons.Form20Filled />}>Fichas</Tab>
        <Tab value="tab5" icon={<Icons.Person20Filled />}>Usuários</Tab>
        <Tab value="tab6" icon={<Icons.Building20Filled />}>Parceiros</Tab>

        <Popover>
          <PopoverTrigger>
            <Avatar style={{ marginLeft: 'auto', marginRight: 8, padding: 4, marginTop: 4, marginBottom: 4 }} />
          </PopoverTrigger>

          <PopoverSurface>
            <Label>
              Vinicius Quaresma da Luz
            </Label>

            <br />

            <Label>
              vinicius@andifes.com
            </Label>

            <div>
              <Badge appearance="filled" size="small">Gestor Andifes</Badge>
            </div>
            <br/>

            <Button appearance='subtle'>Editar perfil</Button>
            <div style={{ display: "inline-block", width: "4px" }} />
            <Button appearance='primary'>Sair</Button>
          </PopoverSurface>
        </Popover>
      </TabList>

      <Divider />

      <div className={styles.root}>
        <DrawerInline separator open>
          <DrawerHeader>
            <DrawerHeaderTitle>Editais</DrawerHeaderTitle>
          </DrawerHeader>

          <DrawerBody>
            <div>
              <Button appearance='primary' content="Novo edital" icon={<Icons.Add20Filled />}>Novo edital</Button>

              <br />
              <br />
              <Divider />

              <br />

              <TabList vertical defaultSelectedValue="tab0">
                <Tab value="tab0" icon={<Icons.Replay20Filled />}>Editais em andamento</Tab>
                <Tab value="tab1" icon={<Icons.Calendar20Filled />}>Editais agendados</Tab>
              </TabList>
            </div>
          </DrawerBody>
        </DrawerInline>
      </div>
    </div>
  );
}

export default LandingPage;
