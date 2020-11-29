Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 929C92C7C01
	for <lists+linux-audit@lfdr.de>; Mon, 30 Nov 2020 00:44:28 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-UTfvGB5HOZmgmoflwGXxuQ-1; Sun, 29 Nov 2020 18:44:25 -0500
X-MC-Unique: UTfvGB5HOZmgmoflwGXxuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA7B41005D65;
	Sun, 29 Nov 2020 23:44:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63EDD60657;
	Sun, 29 Nov 2020 23:44:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E114E4BB40;
	Sun, 29 Nov 2020 23:44:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ATNht6J001943 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 29 Nov 2020 18:43:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 28A64112D421; Sun, 29 Nov 2020 23:43:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23FB4112D41F
	for <linux-audit@redhat.com>; Sun, 29 Nov 2020 23:43:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89FFA858287
	for <linux-audit@redhat.com>; Sun, 29 Nov 2020 23:43:48 +0000 (UTC)
Received: from ithil.bigon.be (ithil.bigon.be [163.172.57.153]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-490-pVzsq73RN0uPBXCgPprliw-1;
	Sun, 29 Nov 2020 18:43:46 -0500
X-MC-Unique: pVzsq73RN0uPBXCgPprliw-1
Received: from localhost (localhost [IPv6:::1])
	by ithil.bigon.be (Postfix) with ESMTP id 722FA1FCCF
	for <linux-audit@redhat.com>; Mon, 30 Nov 2020 00:37:37 +0100 (CET)
Received: from ithil.bigon.be ([IPv6:::1])
	by localhost (ithil.bigon.be [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id pOmlD9mYaAcK for <linux-audit@redhat.com>;
	Mon, 30 Nov 2020 00:37:37 +0100 (CET)
Received: from [IPv6:2a02:a03f:65b8:4300:de23:9854:338b:84b3] (unknown
	[IPv6:2a02:a03f:65b8:4300:de23:9854:338b:84b3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	(Authenticated sender: bigon@bigon.be)
	by ithil.bigon.be (Postfix) with ESMTPSA
	for <linux-audit@redhat.com>; Mon, 30 Nov 2020 00:37:37 +0100 (CET)
To: linux-audit@redhat.com
From: Laurent Bigonville <bigon@debian.org>
Subject: New release?
Message-ID: <10188dab-63c3-4bc3-e950-37a9b3d7ac73@debian.org>
Date: Mon, 30 Nov 2020 00:37:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.5.0
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0ATNht6J001943
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hello,

The freeze of the new debian release is approaching (early next year) 
and I'm looking a bit for guidance about what do with the audit package.

Should I start cherry-picking patches, wait for a new (pre-)release? 
Keep the good 2.8?

Kind regards,

Laurent Bigonville



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

