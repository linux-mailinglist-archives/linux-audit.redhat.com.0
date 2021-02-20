Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C100A320351
	for <lists+linux-audit@lfdr.de>; Sat, 20 Feb 2021 03:56:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-BXmJ2lwTNoe2VksOyMnlpg-1; Fri, 19 Feb 2021 21:56:41 -0500
X-MC-Unique: BXmJ2lwTNoe2VksOyMnlpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC24A801976;
	Sat, 20 Feb 2021 02:56:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C94886F989;
	Sat, 20 Feb 2021 02:56:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 312A04EE0B;
	Sat, 20 Feb 2021 02:56:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11K2u0QT020949 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Feb 2021 21:56:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C83E92026D36; Sat, 20 Feb 2021 02:56:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3E1A2026D13
	for <linux-audit@redhat.com>; Sat, 20 Feb 2021 02:55:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78CEB9291A1
	for <linux-audit@redhat.com>; Sat, 20 Feb 2021 02:55:58 +0000 (UTC)
Received: from mail.namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-514-TjTZWp5nN3SSiqw_L-sS1Q-1;
	Fri, 19 Feb 2021 21:55:55 -0500
X-MC-Unique: TjTZWp5nN3SSiqw_L-sS1Q-1
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 9011F67;
	Sat, 20 Feb 2021 02:54:04 +0000 (UTC)
Date: Sat, 20 Feb 2021 13:54:04 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: security_task_getsecid() and subjective vs objective task
 creds
In-Reply-To: <CAHC9VhSiq5gqY1bfouia4GwYsE9MGGXnUOqwEtHi2u0-1=8aZQ@mail.gmail.com>
Message-ID: <67cacc61-4d6a-39d5-f2c0-5530e8d1e39@namei.org>
References: <CAHC9VhSiq5gqY1bfouia4GwYsE9MGGXnUOqwEtHi2u0-1=8aZQ@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 18 Feb 2021, Paul Moore wrote:

> Hi all,
> 
> When looking into a problem I noticed that audit was recording the
> wrong subject label for a process.

Is this a public bug? It would be good to know what the extent of this 
issue may be and whether it warrants a CVE.

-- 
James Morris
<jmorris@namei.org>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

