Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BB370110C
	for <lists+linux-audit@lfdr.de>; Fri, 12 May 2023 23:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683926634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pGJTqX7bIunpeufx57O12wUXDf2+CIsihURVuD+EUqg=;
	b=g4RS+ck8wQH7wmSyCGwOg8UIfkJh8MiD2uvEKmyZfECr2uMOmSQctMmqUL/2a7DGiWgLyB
	yA6YE5/MSaMJ2w8tN/cL5meJ/iTC+ruDiCiZ3zMDwQDoeeJ7R3zewnWhnhR+ltkVmTLN78
	P7V54yRkl3TQ2jfvyGxZB+6kdeYevps=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-WVjrLHT0NLyUPhzPS1UCng-1; Fri, 12 May 2023 17:23:51 -0400
X-MC-Unique: WVjrLHT0NLyUPhzPS1UCng-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CC881C09064;
	Fri, 12 May 2023 21:23:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE00848FB12;
	Fri, 12 May 2023 21:23:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A1D3119451E9;
	Fri, 12 May 2023 21:23:40 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7B11819451E3 for <linux-audit@listman.corp.redhat.com>;
 Fri, 12 May 2023 21:23:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 76B272027043; Fri, 12 May 2023 21:23:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ED852026DFD
 for <linux-audit@redhat.com>; Fri, 12 May 2023 21:23:34 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49383381D4CD
 for <linux-audit@redhat.com>; Fri, 12 May 2023 21:23:34 +0000 (UTC)
Received: from aplegw01.jhuapl.edu (aplegw01.jhuapl.edu [128.244.251.168])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-QxCGtasUNQC211qEy7-uaQ-1; Fri, 12 May 2023 17:23:30 -0400
X-MC-Unique: QxCGtasUNQC211qEy7-uaQ-1
Received: from pps.filterd (aplegw01.jhuapl.edu [127.0.0.1])
 by aplegw01.jhuapl.edu (8.17.1.19/8.17.1.19) with ESMTP id 34CKo0NF029976
 for <Linux-audit@redhat.com>; Fri, 12 May 2023 17:17:58 -0400
Received: from aplex22.dom1.jhuapl.edu (aplex22.dom1.jhuapl.edu [10.114.162.7])
 by aplegw01.jhuapl.edu (PPS) with ESMTPS id 3qf778vgmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <Linux-audit@redhat.com>; Fri, 12 May 2023 17:17:58 -0400
Received: from APLEX26.dom1.jhuapl.edu (10.114.162.11) by
 APLEX22.dom1.jhuapl.edu (10.114.162.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 May 2023 17:17:57 -0400
Received: from APLEX26.dom1.jhuapl.edu ([fe80::8b67:5cb8:8fbe:fd18]) by
 APLEX26.dom1.jhuapl.edu ([fe80::8b67:5cb8:8fbe:fd18%12]) with mapi id
 15.02.1118.026; Fri, 12 May 2023 17:17:57 -0400
From: "Wieprecht, Karen M." <Karen.Wieprecht@jhuapl.edu>
To: "Linux-audit@redhat.com" <Linux-audit@redhat.com>
Subject: What STIG audit rule picks up type=SOFTWARE_UPDATE events?
Thread-Topic: What STIG audit rule picks up type=SOFTWARE_UPDATE events?
Thread-Index: AdmFCk3zm3FM9tdHSrSSGqt8WBugUw==
Date: Fri, 12 May 2023 21:17:57 +0000
Message-ID: <7622dda18a1544c3bb52052019e34d72@jhuapl.edu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.162.18]
MIME-Version: 1.0
X-CrossPremisesHeadersFilteredBySendConnector: APLEX22.dom1.jhuapl.edu
X-OrganizationHeadersPreserved: APLEX22.dom1.jhuapl.edu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_13,2023-05-05_01,2023-02-09_01
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: jhuapl.edu
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============4869946541222567185=="

--===============4869946541222567185==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7622dda18a1544c3bb52052019e34d72jhuapledu_"

--_000_7622dda18a1544c3bb52052019e34d72jhuapledu_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

Do you happen to know which if the standard STIG rules is picking up   type=
=3DSOFTWARE_UPDATE events on RHEL 7 and 8 ?   I'm trying to figure out if w=
e missed one of these rules on an Ubuntu 20 system we are configuring  or i=
f maybe the audit subsystem implementation on that system doesn't pick up a=
ll of the same record types as we get on our RHEL boxes.  I realized when I=
 started looking at this that it's not easy to determine which audit rule i=
s picking up a particular event if it's not one of the rule that has a key =
associated with it.

As a possible alternative,   I ran across a sample audit.rules  list here G=
itHub - Neo23x0/auditd: Best Practice Auditd Configuration<https://github.c=
om/Neo23x0/auditd>  (actual rules file is here: auditd/audit.rules at maste=
r * Neo23x0/auditd * GitHub<https://github.com/Neo23x0/auditd/blob/master/a=
udit.rules>) which included some software management rules that don't appea=
r to be  part of the standard "30-stig.rules" .

If the standard STIG rules don't pick up  type=3DSOFTWARE_UPDATE events on =
Ubuntu20,  I might add some of these , so I was hoping to have a quick sani=
ty check on whether these look like appropriate alternatives.  Any recommen=
dations or comments regarding these sample rules would be much appreciated.=
  Basically it looks to me like they are just setting watches for anyone  e=
xecuting these various commands, which shouldn't cause to much noise in the=
 logs except maybe when we are patching which is one of the continuous moni=
toring items I  need to be able to confirm.

Thanks much!
Karen Wieprecht

# Software Management -----------------------------------------------------=
----

# RPM (Redhat/CentOS)
-w /usr/bin/rpm -p x -k software_mgmt
-w /usr/bin/yum -p x -k software_mgmt

# DNF (Fedora/RedHat 8/CentOS 8)
-w /usr/bin/dnf -p x -k software_mgmt

# YAST/Zypper/RPM (SuSE)
-w /sbin/yast -p x -k software_mgmt
-w /sbin/yast2 -p x -k software_mgmt
-w /bin/rpm -p x -k software_mgmt
-w /usr/bin/zypper -k software_mgmt

# DPKG / APT-GET (Debian/Ubuntu)
-w /usr/bin/dpkg -p x -k software_mgmt
-w /usr/bin/apt -p x -k software_mgmt
-w /usr/bin/apt-add-repository -p x -k software_mgmt
-w /usr/bin/apt-get -p x -k software_mgmt
-w /usr/bin/aptitude -p x -k software_mgmt
-w /usr/bin/wajig -p x -k software_mgmt
-w /usr/bin/snap -p x -k software_mgmt

# PIP(3) (Python installs)
-w /usr/bin/pip -p x -k T1072_third_party_software
-w /usr/local/bin/pip -p x -k T1072_third_party_software
-w /usr/bin/pip3 -p x -k T1072_third_party_software
-w /usr/local/bin/pip3 -p x -k T1072_third_party_software

# npm
## T1072 third party software
## https://www.npmjs.com
## https://docs.npmjs.com/cli/v6/commands/npm-audit
-w /usr/bin/npm -p x -k T1072_third_party_software

--_000_7622dda18a1544c3bb52052019e34d72jhuapledu_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:Consolas;
=09panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:#0563C1;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:#954F72;
=09text-decoration:underline;}
code
=09{mso-style-priority:99;
=09font-family:"Courier New";}
pre
=09{mso-style-priority:99;
=09mso-style-link:"HTML Preformatted Char";
=09margin:0in;
=09margin-bottom:.0001pt;
=09font-size:10.0pt;
=09font-family:"Courier New";}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
span.HTMLPreformattedChar
=09{mso-style-name:"HTML Preformatted Char";
=09mso-style-priority:99;
=09mso-style-link:"HTML Preformatted";
=09font-family:"Courier New";}
.MsoChpDefault
=09{mso-style-type:export-only;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">All,&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Do you happen to know which if the standard STIG rul=
es is picking up &nbsp;&nbsp;type=3DSOFTWARE_UPDATE events on RHEL 7 and 8 =
?&nbsp;&nbsp; I&#8217;m trying to figure out if we missed one of these rule=
s on an Ubuntu 20 system we are configuring&nbsp; or if maybe the audit
 subsystem implementation on that system doesn&#8217;t pick up all of the s=
ame record types as we get on our RHEL boxes.&nbsp; I realized when I start=
ed looking at this that it&#8217;s not easy to determine which audit rule i=
s picking up a particular event if it&#8217;s not one of
 the rule that has a key associated with it.&nbsp; &nbsp;&nbsp;<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As a possible alternative,&nbsp;&nbsp; I ran across =
a sample audit.rules &nbsp;list here
<a href=3D"https://github.com/Neo23x0/auditd">GitHub - Neo23x0/auditd: Best=
 Practice Auditd Configuration</a> &nbsp;(actual rules file is here:
<a href=3D"https://github.com/Neo23x0/auditd/blob/master/audit.rules">audit=
d/audit.rules at master &middot; Neo23x0/auditd &middot; GitHub</a>) which =
included some software management rules that don&#8217;t appear to be &nbsp=
;part of the standard &#8220;30-stig.rules&#8221; .&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If the standard STIG rules don&#8217;t pick up &nbsp=
;type=3DSOFTWARE_UPDATE events on Ubuntu20, &nbsp;I might add some of these=
 , so I was hoping to have a quick sanity check on whether these look like =
appropriate alternatives.&nbsp; Any recommendations or comments
 regarding these sample rules would be much appreciated.&nbsp; Basically it=
 looks to me like they are just setting watches for anyone &nbsp;executing =
these various commands, which shouldn&#8217;t cause to much noise in the lo=
gs except maybe when we are patching which is one
 of the continuous monitoring items I &nbsp;need to be able to confirm.&nbs=
p; &nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks much!<o:p></o:p></p>
<p class=3D"MsoNormal">Karen Wieprecht <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"># Software Manageme=
nt ---------------------------------------------------------<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"># RPM (Redhat/CentO=
S)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/rpm -p =
x -k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/yum -p =
x -k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"># DNF (Fedora/RedHa=
t 8/CentOS 8)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/dnf -p =
x -k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"># YAST/Zypper/RPM (=
SuSE)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /sbin/yast -p x =
-k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /sbin/yast2 -p x=
 -k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /bin/rpm -p x -k=
 software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/zypper =
-k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"># DPKG / APT-GET (D=
ebian/Ubuntu)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/dpkg -p=
 x -k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/apt -p =
x -k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/apt-add=
-repository -p x -k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/apt-get=
 -p x -k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/aptitud=
e -p x -k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/wajig -=
p x -k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/snap -p=
 x -k software_mgmt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"># PIP(3) (Python in=
stalls)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/pip -p =
x -k T1072_third_party_software<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/local/bin/p=
ip -p x -k T1072_third_party_software<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/pip3 -p=
 x -k T1072_third_party_software<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/local/bin/p=
ip3 -p x -k T1072_third_party_software<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in"># npm<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">## T1072 third part=
y software<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">## https://www.npmj=
s.com<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">## https://docs.npm=
js.com/cli/v6/commands/npm-audit<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#1F2328;border:none windowtext 1.0pt;padding:0in">-w /usr/bin/npm -p =
x -k T1072_third_party_software</span><o:p></o:p></p>
</div>
</body>
</html>

--_000_7622dda18a1544c3bb52052019e34d72jhuapledu_--

--===============4869946541222567185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============4869946541222567185==--

