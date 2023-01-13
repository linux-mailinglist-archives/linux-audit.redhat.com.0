Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368266A6A7
	for <lists+linux-audit@lfdr.de>; Sat, 14 Jan 2023 00:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673651183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zJndiczg9qfv75vkCocFr1KuJUpkV3iq0tx8k6Q2r2U=;
	b=gAPYOSAVPtKJY/2D5L365NUkPdkAkcMRzQEsbwUS4vNV9WUvxobDWLiiU/Bzi5GgKE7NyW
	uCU37Vc77rqA1JspawHnWyYQe/5wRnniDwjNm3AKlU5pzq0KubDUDwLYGysnSWrCMsr/wP
	jhJAbtzQt+TKCggtzfz193A3zPjl8bg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-PJkXBzVLOfmKc6Y0skCP5g-1; Fri, 13 Jan 2023 18:06:18 -0500
X-MC-Unique: PJkXBzVLOfmKc6Y0skCP5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E923018483B9;
	Fri, 13 Jan 2023 23:06:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42ADF14171B7;
	Fri, 13 Jan 2023 23:06:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6A67B19459D3;
	Fri, 13 Jan 2023 23:06:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B4E64194706F for <linux-audit@listman.corp.redhat.com>;
 Fri, 13 Jan 2023 23:05:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A46741121315; Fri, 13 Jan 2023 23:05:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B8681121314
 for <linux-audit@redhat.com>; Fri, 13 Jan 2023 23:05:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79B0F280BCB3
 for <linux-audit@redhat.com>; Fri, 13 Jan 2023 23:05:58 +0000 (UTC)
Received: from aplegw01.jhuapl.edu (aplegw01.jhuapl.edu [128.244.251.168])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-qFLNZtD_OauNjOPRuGDadg-1; Fri, 13 Jan 2023 18:05:56 -0500
X-MC-Unique: qFLNZtD_OauNjOPRuGDadg-1
Received: from pps.filterd (aplegw01.jhuapl.edu [127.0.0.1])
 by aplegw01.jhuapl.edu (8.17.1.19/8.17.1.19) with ESMTP id 30DM2wMN005464
 for <Linux-audit@redhat.com>; Fri, 13 Jan 2023 17:47:27 -0500
Received: from aplex24.dom1.jhuapl.edu (aplex24.dom1.jhuapl.edu [10.114.162.9])
 by aplegw01.jhuapl.edu (PPS) with ESMTPS id 3n1k4muv34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <Linux-audit@redhat.com>; Fri, 13 Jan 2023 17:47:27 -0500
Received: from APLEX26.dom1.jhuapl.edu (10.114.162.11) by
 APLEX24.dom1.jhuapl.edu (10.114.162.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Fri, 13 Jan 2023 17:47:27 -0500
Received: from APLEX26.dom1.jhuapl.edu ([fe80::8b67:5cb8:8fbe:fd18]) by
 APLEX26.dom1.jhuapl.edu ([fe80::8b67:5cb8:8fbe:fd18%12]) with mapi id
 15.02.1118.020; Fri, 13 Jan 2023 17:47:27 -0500
From: "Wieprecht, Karen M." <Karen.Wieprecht@jhuapl.edu>
To: "Linux-audit@redhat.com" <Linux-audit@redhat.com>
Subject: audit rules to help watch for potential threat?
Thread-Topic: audit rules to help watch for potential threat?
Thread-Index: AdknlqZjme7lhk3URhm4uyi6dzqNLg==
Date: Fri, 13 Jan 2023 22:47:27 +0000
Message-ID: <f50b2b89293f425ea56ec358837dd1eb@jhuapl.edu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.114.162.26]
MIME-Version: 1.0
X-CrossPremisesHeadersFilteredBySendConnector: APLEX24.dom1.jhuapl.edu
X-OrganizationHeadersPreserved: APLEX24.dom1.jhuapl.edu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Steve, Audit team,

My colleagues and I were discussing ways we might better monitor for  potential insider threat.   We can easily see the commands our SAs run when they use sudo in front of the command,   but if the  sysadmin uses "sudo su -", then we don't have good visibility into the commands they perform while they are su'd unless there happens to be an audit rule monitoring the specific files/commands they are accessing/running.  

We've talked about possible way to improve our visibility in this situation, but most of the options we came up with are easily thwarted and/or would cause the logs to blow up to the point that it's difficult to spot  nefarious activity.   Some options we considered included having splunk monitor the shell history files, and possibly enabling ps auditing.

Can you recommend any audit rules that would audit the interactive commands being issued by a sysadmin who is su'd as root without causing the logs to blow up?   

Any assistance you can provide would be much appreciated.

Thank you,
Karen Wieprecht 
The Johns Hopkins Applied Physics Laboratory
--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

