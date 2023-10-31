Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 889587DD7B8
	for <lists+linux-audit@lfdr.de>; Tue, 31 Oct 2023 22:24:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698787487;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=17AIdszY/KQzKqajga9cVrB40RvrsrgZf/YpqvHPr6Y=;
	b=F1k3f2DHlEdXfvWIVihCEFEmICM5spOG04MeWOqtN2quvH3azogZ91BP1y6HQDb8fjNdPA
	WJbqoWkL2/G/VZBGw4g0D3fEakfP0aZARnP/OLupprA/u5MAWyrdb+tNic5KGaKBFmd1Ug
	KxvCOgymTqLQO9qKOnwpq/PQmVNXm/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-kdxoVT89POSdj3wHzrIfmQ-1; Tue, 31 Oct 2023 17:24:38 -0400
X-MC-Unique: kdxoVT89POSdj3wHzrIfmQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 839BD862DC1;
	Tue, 31 Oct 2023 21:24:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32DB92026D66;
	Tue, 31 Oct 2023 21:24:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AF94D19465A0;
	Tue, 31 Oct 2023 21:24:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 96C181946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 31 Oct 2023 21:24:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 281D7492BE9; Tue, 31 Oct 2023 21:24:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.33.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C511492BE0
 for <linux-audit@redhat.com>; Tue, 31 Oct 2023 21:24:26 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Linux Audit Mail List
Date: Tue, 31 Oct 2023 17:24:26 -0400
Message-ID: <2179196.irdbgypaU6@x2>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I think the linux-audit mail list will be shutdown at midnight tonight. Watch

https://people.redhat.com/sgrubb/audit/

for updates. If we can continue somewhere, I'll link to it from that page. 
There are mail archives such as 

https://marc.info/?l=linux-audit&r=1&w=2

if you need historical information.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

