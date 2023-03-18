Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD416BFB08
	for <lists+linux-audit@lfdr.de>; Sat, 18 Mar 2023 15:57:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679151451;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=umrP21NClAV0cTs0tuMjmMK7AYOAIRqRCngKV3Pze2E=;
	b=FEwriBMlglSRg2nvJ3+FHLjRAFMILNlI3ntaKUmt+xNJoTPt8zvDuMmaWtts2MY4aqbIKj
	7LWp9ZWkAtsdoDM887ncCJ1tBpw9B7sVODxu76tso2LclWh5gKtJnaKyXa6Q2En3VS5jC0
	Xwhskuot6FFPmySj3AuVT+CVOSMeW/4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-qk6tO-B7OVyXKe7yYss_3w-1; Sat, 18 Mar 2023 10:57:29 -0400
X-MC-Unique: qk6tO-B7OVyXKe7yYss_3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B3721C0419D;
	Sat, 18 Mar 2023 14:57:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5961F40C6E67;
	Sat, 18 Mar 2023 14:57:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 54F101946A54;
	Sat, 18 Mar 2023 14:57:17 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0C75F1946595 for <linux-audit@listman.corp.redhat.com>;
 Sat, 18 Mar 2023 14:57:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DD8D6400D9CD; Sat, 18 Mar 2023 14:57:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D29A740CF8F1
 for <linux-audit@redhat.com>; Sat, 18 Mar 2023 14:57:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 248823802AC5
 for <linux-audit@redhat.com>; Sat, 18 Mar 2023 14:57:15 +0000 (UTC)
Received: from MX3.LL.MIT.EDU (mx3.ll.mit.edu [129.55.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-PtRlw0M2Ow61KzVVC9YO4Q-1; Sat, 18 Mar 2023 10:57:12 -0400
X-MC-Unique: PtRlw0M2Ow61KzVVC9YO4Q-1
Received: from LLEX2019-3.mitll.ad.local (llex2019-3.llan.ll.mit.edu
 [172.25.4.125])
 by MX3.LL.MIT.EDU (8.17.1.19/8.17.1.19) with ESMTPS id 32IEa3FS137969
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <linux-audit@redhat.com>; Sat, 18 Mar 2023 10:36:03 -0400
From: "Christiansen, Edward - 0992 - MITLL" <edwardc@ll.mit.edu>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: run script after auditd rotates logs
Thread-Topic: run script after auditd rotates logs
Thread-Index: AdlZpqI3R4ioBZC7RFGR0bgFiGsa+Q==
Date: Sat, 18 Mar 2023 14:36:01 +0000
Message-ID: <BN0P110MB1210873AA2E95F81D143AD299C829@BN0P110MB1210.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1210:EE_|BN0P110MB1144:EE_
x-ms-office365-filtering-correlation-id: 81c6859d-a4ed-44ea-c136-08db27be18b9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: BF2jRr0O53LAYj2WJOs+Q2gp1ixMUx2WWVnQfokVvXY0VP2PBNNeYfZcU3UAHm26s4YNoCP/AYUWPlz+msh89ciGvFMfMggh73TcPi+jBeW4NmfWytmYhboZ486x6ARpv4zhH1RvifEmK03Wq3XNWt3fZ7VBq86IVs+k07qjicExP20WiegcCnt9gvddZv97GeqEZ0zwl3iIjMJdvE51jnbN1o9GqH3YfeMCq7ASsG5jvwgK1grrIAqSCwex8OsnbeXOViry5wzltLBkvydEmUQPkrMLw7bB3AQPFEajBKLjVIK+2BORd21RzblG77TVWZbOyrRCuOm6vtq2eLXOv3zMpEXAy7OVljO9Q7XclzRy259KGduM56BpQ+pRSg/WqYP80n657OUbea8ICTAJYaCBbxDcAu9sJFKDDrKL6UhqRFKm6IhTMSuWKKkqFvktyTXpFDHYzwOFJ/8RyJB2H+N8uqOp12r2SlUCzG5iKkUG+8ECqxdEZCLtHZIoKswuFFwwDOhX4c8cZz9iQc0nk4kAfMvpCtb+PvF5EWL927G2FSGNZoGdrhBkMNqgcxQkIAGjKCSwDbT6VbQyUcm91CUxMTfm7jShH81pAPkJrEwBgeVmM/W59nOEP5iZiTBP0QbS0lEdfigSgjUzL6rNmmW1pRqzzs61S7ALp7rB5FmKm+XkvQndgAZZLT5UnjQHSIneOpxM2SzvPZRL0AWAGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1210.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39830400003)(136003)(366004)(451199018)(2906002)(38070700005)(41300700001)(83380400001)(41320700001)(186003)(4744005)(8936002)(26005)(52536014)(9686003)(6506007)(38100700002)(122000001)(5660300002)(508600001)(33656002)(86362001)(66946007)(99936003)(76116006)(66556008)(64756008)(8676002)(6916009)(66446008)(66476007)(55016003)(75432002)(71200400001)(7696005);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmR2OGd5UmVTRHlGa09yc0FiRThJNks0VHdyU1BJM3JRRkNVSTdHblNxUG85?=
 =?utf-8?B?MVdmdEpmM2FLcFNzVWoyRmtGaEJ3dHVucDlJQm1NUDRCSHRZZFRCWDR0Lzdl?=
 =?utf-8?B?blFmN3MrR3hqRXZSaE84bkxCY2syZXNBK094TThrR0RnR3ZKZ3hIQ0Y4bDdE?=
 =?utf-8?B?RS9KUlRaVHJFUmo3SGw1a3ZjdVBzcmZFRXR4OU5pT3dRN011U05JWUJsdnRJ?=
 =?utf-8?B?bFJaZVViV09EQmZXb3lWTEM5QWZJQUlCL1lZbW1rdUQrTGpqUVcrM3VLNysy?=
 =?utf-8?B?MTNwNm9WNEhHZkxtNzcvdnptWDlIL04yNXBWd1JLaUloWFpsMnlGdmtYeTRJ?=
 =?utf-8?B?NFRuKzZMOWdxWDhyTTUvOWs5U1E4NDgzK3NNV0kvMk1TUU1qN0xyNm5MS2Qv?=
 =?utf-8?B?SnMweDVKZjhFdUlYdDJtVVFMdE9UcGtndFFHN2Z4MXFNL3huSk1ZbFlrQUs1?=
 =?utf-8?B?OTVLWDZJaExhdUU1ZVkrYWdZRHNBeFR2dWJ0QVA1MGRIb2Y2ZlViYkVtZlRI?=
 =?utf-8?B?Q3NTeDlBNGtVazNRUHhEMk9US0t3NWRrakRha2VxdDk3TXlBS25lcnJReDcy?=
 =?utf-8?B?aHhpY1pjWWVkRXJJNFF2T1RuMTJxdkdjUi93Y1N0TXEwbVBNU0xDUUNlMk1t?=
 =?utf-8?B?a091QmVWQlFRWVhZSzhZYXAvRWpaZzdZOGM3cEJiWmd4V3pXdk9nVXA3MVdM?=
 =?utf-8?B?aWZkY3hTVnJGd2JJNk9Qc1Fick9iT2RSL3ZUdmpCZCtKU1I0TlFsRWxOSE5Y?=
 =?utf-8?B?em1POXk2YUlzd3hMbHVpQktnMFBUYnNIelI4TnNHUndmSVlnUHc4L3FjUmxT?=
 =?utf-8?B?UEluMC85eUZtdjRwaE5uOUp4L1VBNFdrYy8yWDhiazVweVIvSk5EVUM4M0pX?=
 =?utf-8?B?R3JQQ2ZySTdqVFJmclE4NER3VGR5SktwNmJYV1lWYjJITm1rSEJkVW5uYjlo?=
 =?utf-8?B?ZHovakV0c3l3Q0dwQ1lDaFVBQjVEU0plMmxJUlZDNndCUjZ5RDlxNTloTEM3?=
 =?utf-8?B?VWJJT00rWW1ZbkxpN1VtaEFYbmttdGV4cWdmNjd0VS92dlduK3pxSXBzS2E2?=
 =?utf-8?B?S0pRWTBqZlZCcXIrNjBBSzYwZXBadnpJM21qcFcxUkp1WTZNV0NTdkcrZElS?=
 =?utf-8?B?TU1ZWWJJRHExTDdzM1M0VWVoMHVrdmFMcmZINWlFVXRyaFk3aHFTUnN6WTJE?=
 =?utf-8?B?bU5seDRWUGRBRHRPV0haajA0bzZqYXJaOUFRMFJnUFpMYytuZitLK3BKVUpw?=
 =?utf-8?B?ck5RUEl4a0NZL3FWUXVPN0dpQnQvOE5OUDBlTXBQUkdNanJFbWdCOFo3VWo0?=
 =?utf-8?B?RzdSWFJmczZ5Nm1xWnliSUloV1pBbVdrV2ppUlNzOXIyT3ZUeE1vN2tXRzV4?=
 =?utf-8?B?YTNjbW5aMTlTekRKUjM5R1FNZ1RBRWw5dEwwRWdIaVk1TDJOWkNQUVloN1ND?=
 =?utf-8?B?SWtTaVJZZGJ1ZDFqS2gvTFl3NlAwdS85OWR6VFlkQVlGejIxMW9mYWhUbnVY?=
 =?utf-8?B?Qi9UajF3ZXBNSkM3dmtIRjQ0VXVvdkxwWEdGV3JZd2pvWFpONjlVMG85Z2lq?=
 =?utf-8?B?d0ZsWmJHcHlOMTR4QSttWlNTcXkrN1JITEhBemdKV3o4YVF6V2thcThBQ0x5?=
 =?utf-8?B?TGVrVXh0S1d3NGVZSlpwbVhEWCt5cVZjRWFLYnRSTjlmMUZpTjJYSFByZVNk?=
 =?utf-8?B?K0FCZTcwRVcyM0Rrb2tHVEJDZVp6Qm5VTnZMZjdtdjJROWJuTnNWbEpDNVRW?=
 =?utf-8?B?by9Va3h2dnQ2cmx6MWtnQmtpK0ZIVURUdlcyNGJBNnZJVXVtRGdRL3dqV3Iz?=
 =?utf-8?B?NnE2RnVQWFNNMXd3TW5DeHBaTzI3ZmZuNm9neStJQnFVRzhUYXV4Yng4ZlJz?=
 =?utf-8?B?Y3QvQ0J3QVllT2hiME1JbERoTFpabTZrcTJLdlFsNVVzTTJyZWxCTUY4UFBV?=
 =?utf-8?B?eUZqbDVVRUJWSDdqMDJOQW5FZFVEK2p2N1JIcVVXUVRHOUdPdWtZeDVlbGVF?=
 =?utf-8?Q?PT1+m81LXky+9fR0Ju2Xq7Ty0dq0uY=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1210.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c6859d-a4ed-44ea-c136-08db27be18b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2023 14:36:01.4529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 83d1efe3-698e-4819-911b-0a8fbe79d01c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1144
X-Proofpoint-GUID: k3VwyK64zgHL5zswawkuiW_QJjshyJYx
X-Proofpoint-ORIG-GUID: k3VwyK64zgHL5zswawkuiW_QJjshyJYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-18_08,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 spamscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303180126
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============1078581173475061150=="

--===============1078581173475061150==
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=2.16.840.1.101.3.4.2.1;
	boundary="----=_NextPart_000_00A0_01D95985.6E54BD70"

------=_NextPart_000_00A0_01D95985.6E54BD70
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

I would like to know if there is a way to tell auditd to run a script or 
command after it rotates its logs.  I can do this with logrotate, but would 
much prefer something native to auditd.  I spent some toime with Google and 
found only logrotate solutions.

Thanks,

Ed Christiansen
Millstone Hill SysAdmin

------=_NextPart_000_00A0_01D95985.6E54BD70
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCElkw
ggOKMIICcqADAgECAgEBMA0GCSqGSIb3DQEBCwUAMFYxCzAJBgNVBAYTAlVTMR8wHQYDVQQKExZN
SVQgTGluY29sbiBMYWJvcmF0b3J5MQwwCgYDVQQLEwNQS0kxGDAWBgNVBAMTD01JVExMIFJvb3Qg
Q0EtMjAeFw0xNjA0MjAxMjAwMDBaFw0zNTA0MTkyMzU5NTlaMFYxCzAJBgNVBAYTAlVTMR8wHQYD
VQQKExZNSVQgTGluY29sbiBMYWJvcmF0b3J5MQwwCgYDVQQLEwNQS0kxGDAWBgNVBAMTD01JVExM
IFJvb3QgQ0EtMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL91qARBjjibZuLnL2n+
ryiBT7PMGrQnekpsKv13kTaOz94zyMTT8Bd/fERg1JjySFwO4ncw+o9KKRSFvpC6mMnvXu/PD1dH
amiZV/PNfHzQ20hPvAeoYnqik0e1XziO+FFUBFClURbkRcOrlWLr4HsNk4/wtnRHnt+3q7kJeZx5
G1djrFp2ezvsrfnrXeh0XGly5T/avFioANwe75DlSDAiqALmlo/gRauyvljZIsovynTh/SZjqW8k
SuI3AO8Wy5xfCRVEjYOXOGNQSaxWmbZAnhujZvaeduBpZZERcz4KY/FYnFfgCvva2NO3U8dNpGKL
U5yrstGMQQMLFF8QEBMCAwEAAaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQU/8nJZUxT
gPGpDDwhroIqx+74MvswHwYDVR0jBBgwFoAU/8nJZUxTgPGpDDwhroIqx+74MvswDgYDVR0PAQH/
BAQDAgGGMA0GCSqGSIb3DQEBCwUAA4IBAQB6mHxH/9yeWjCoZWEND51AGzAfI2Uq/fx743zhdNHK
xVAn0q6hvCUMKPkv4quuoHKethRICdH0JA4FYOpvgthE6NS6FoksYWAn3EiEBApY5V8EfMBUmshf
NtkuvSKrx4XauHefI1OoGIurLI1OL8LL7FS0SSpP5vwoP8PIFumBzOWoQQ+v+QnHpdnyO6EprJDv
fdfqLawtdWHw8Ahb8+wJtK/ivYlYUlrWuIZiLldGAYmtO3mSkjtNiz4EPGDs95LtGLfpofFVkSrs
dgnGIzKZPlg1dATKe+bam+qagRZHCrxAV6sYPvPhv7po4ouB9HOZLyYWkMspG5jipsTvSHCSMIIE
wDCCA6igAwIBAgIBBjANBgkqhkiG9w0BAQsFADBWMQswCQYDVQQGEwJVUzEfMB0GA1UEChMWTUlU
IExpbmNvbG4gTGFib3JhdG9yeTEMMAoGA1UECxMDUEtJMRgwFgYDVQQDEw9NSVRMTCBSb290IENB
LTIwHhcNMTcwMzAyMTIwMDAwWhcNMjYwMzAyMjM1OTU5WjBRMQswCQYDVQQGEwJVUzEfMB0GA1UE
CgwWTUlUIExpbmNvbG4gTGFib3JhdG9yeTEMMAoGA1UECwwDUEtJMRMwEQYDVQQDDApNSVRMTCBD
QS01MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp5qDDr05H8O56tfZq1msxmmvkPN1
L9PgE1096upK/lhMSDCGfOwu+FgnEV6bzu7r8ex7zLGFgBR1vd8EMIY8rcRyDmYCjSeFZxlQ1Jfi
iO4NJ/fmY7d4Qdx4R23L23vfmOI8/l8woi5djmmLyAim8b2wUgi7TxHmUOsek2+hCtMptIL2Hhzt
5LrmPkiRyTJbW6y5yFS8Y2azVUu+81yr7ukN4UnZESAe5CYBF3y/qf8/9qfeGxBGdk50M9E5Doxv
iau1JV5RUbb7GHAzxEA91DZGbFnF4AtYVxvExpJ1HAIZRsVYZSpRS5jXe9+NrHhstrPWMTQ50hPn
l07W9COSywIDAQABo4IBnDCCAZgwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUL++7xg0d
u+lq/qxn8wc7CHb2S1kwHwYDVR0jBBgwFoAU/8nJZUxTgPGpDDwhroIqx+74MvswDgYDVR0PAQH/
BAQDAgGGMGcGCCsGAQUFBwEBBFswWTAuBggrBgEFBQcwAoYiaHR0cDovL2NybC5sbC5taXQuZWR1
L2dldHRvL0xMUkNBMjAnBggrBgEFBQcwAYYbaHR0cDovL29jc3AubGwubWl0LmVkdS9vY3NwMDQG
A1UdHwQtMCswKaAnoCWGI2h0dHA6Ly9jcmwubGwubWl0LmVkdS9nZXRjcmwvTExSQ0EyMIGSBgNV
HSAEgYowgYcwDQYLKoZIhvcSAgEDAQYwDQYLKoZIhvcSAgEDAQgwDQYLKoZIhvcSAgEDAQcwDQYL
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
HzAdBgNVBAoTFk1JVCBMaW5jb2xuIExhYm9yYXRvcnkxDzANBgNVBAsTBlBlb3BsZTEnMCUGA1UE
AxMeQ2hyaXN0aWFuc2VuLkVkd2FyZC5KLjUwMDA1NjM0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAveg/nnrZNP+vdsWKYlSg0FX0rGTPsYz7tVcH2uHQOZmbWtaxoM635H3vQdYd9u8r
oxn7avXkZ2jmjvQgZ4L0lWDfS6paMa2F+YXoDo6PwT+hiyHIungk1J2E23aDK9axVEbMT8/+la/f
8+Y+UsQ/G2883HgjtlCa/ACoJICNhWtLRw60V2NjnldmcphcyG1zoUBL9ahgWDJWouT1P2IU/w+o
Ki7rw0N1VnpzCMSiYY+yQYeh1IvrL2mAICICXuoLSL88fjrI69x3t0UHdux9Gle5OxRXgmlKovqk
nISuygB5CJJQeyZ9JEUaUr/W53rqzpJRJefq17aoSpUOCpC6RwIDAQABo4IBuTCCAbUwHQYDVR0O
BBYEFEzRVcafiLXoUE35e5g7UJ3wjp8IMA4GA1UdDwEB/wQEAwIFIDAfBgNVHSMEGDAWgBQv77vG
DR276Wr+rGfzBzsIdvZLWTAzBgNVHR8ELDAqMCigJqAkhiJodHRwOi8vY3JsLmxsLm1pdC5lZHUv
Z2V0Y3JsL2xsY2E1MGYGCCsGAQUFBwEBBFowWDAtBggrBgEFBQcwAoYhaHR0cDovL2NybC5sbC5t
aXQuZWR1L2dldHRvL2xsY2E1MCcGCCsGAQUFBzABhhtodHRwOi8vb2NzcC5sbC5taXQuZWR1L29j
c3AwPQYJKwYBBAGCNxUHBDAwLgYmKwYBBAGCNxUIg4PlHYfsp2aGrYcVg+rwRYW2oR8dhevQcIPr
7SACAWQCAQswJQYDVR0lBB4wHAYEVR0lAAYIKwYBBQUHAwQGCisGAQQBgjcKAwQwHQYDVR0RBBYw
FIESZWR3YXJkY0BsbC5taXQuZWR1MBgGA1UdIAQRMA8wDQYLKoZIhvcSAgEDAQgwJwYJKwYBBAGC
NxQCBBoeGABMAEwAVQBzAGUAcgBFAG4AYwAtAFMAVzANBgkqhkiG9w0BAQsFAAOCAQEAECYa1Q/x
E7jaGWUFqlt/jHafeZka4WxG26s8ySz+wLyDPAPbADmV3nxtqFwqrS4QNGM0t5QLCoN12QlLR2HL
Vk4/Z7eKmsLhj65MY3FmTVBeu74SpDeR1jHxXvoI9NYZ/nXrySn3c2JOx/I1D6glK5NB/fzzwVzA
YlpSVPguTA8rp/uUluHHknkjrv+t9FHjUHcEl+t+UqQyR7LS7wl7Kd508gSKdJnWyukV9zDlulKh
eFAKdIVFeLrr3JleMWUrVE3NX9B7JMrbZcqU/vEVQx6dKPsCi/KOfiYorxUpTCOeSV8RuM/2HHgR
H+actZizpOzaehROESyjXnXgZztSFjGCA4owggOGAgEBMGgwUTELMAkGA1UEBhMCVVMxHzAdBgNV
BAoMFk1JVCBMaW5jb2xuIExhYm9yYXRvcnkxDDAKBgNVBAsMA1BLSTETMBEGA1UEAwwKTUlUTEwg
Q0EtNQITWQAFDeB4a6v0/8PFRwAAAAUN4DANBglghkgBZQMEAgEFAKCCAfMwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMzE4MTQzNjAwWjAvBgkqhkiG9w0BCQQx
IgQgsQJXowaTa9Yj6HgSI3pTJaTMvpCq4cEUqR+xkXJwRXYwdwYJKwYBBAGCNxAEMWowaDBRMQsw
CQYDVQQGEwJVUzEfMB0GA1UECgwWTUlUIExpbmNvbG4gTGFib3JhdG9yeTEMMAoGA1UECwwDUEtJ
MRMwEQYDVQQDDApNSVRMTCBDQS01AhNZAAUcQtlmmguWTv5kAAAABRxCMHkGCyqGSIb3DQEJEAIL
MWqgaDBRMQswCQYDVQQGEwJVUzEfMB0GA1UECgwWTUlUIExpbmNvbG4gTGFib3JhdG9yeTEMMAoG
A1UECwwDUEtJMRMwEQYDVQQDDApNSVRMTCBDQS01AhNZAAUcQtlmmguWTv5kAAAABRxCMIGTBgkq
hkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggqhkiG9w0DBzALBglg
hkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAsGCWCGSAFlAwQCATALBglg
hkgBZQMEAgMwCwYJYIZIAWUDBAICMAcGBSsOAwIaMA0GCSqGSIb3DQEBAQUABIIBAFiHOAsNzwrS
mCzXwniHEWdzqBqKZlhBuxse4CdlnvC0b5D3Jm/56TYbWYNdLiwJ0o7eNDXch87apaQLKzI7Cm/5
nMo3MaidjYziTfejhDMVUsgRw7TuI134KaXoY5zWvAa0xJ1PBNZVur+hv3Vhj0Kql7ap9DMkUmQb
vODK+BZlsr+VX2yajElFHvVCgh4iPGLwvy5+SeBPsr87BMO+gZLq84/hRKfFn9vxxz5n57Umn7Aa
l5SzWiDZsUDNrRKA7OYIEwuLuKlh8Koq5WMh/uG87yOhrbmjltZRT3atWXxtwP11gbd6S3k+2nse
3jhqna8BvwwatjN7AB8fp7ZHG0IAAAAAAAA=
------=_NextPart_000_00A0_01D95985.6E54BD70--

--===============1078581173475061150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============1078581173475061150==--

