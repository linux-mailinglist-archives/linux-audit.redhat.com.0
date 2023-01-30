Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED36816ED
	for <lists+linux-audit@lfdr.de>; Mon, 30 Jan 2023 17:51:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675097514;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GkpoApymTIh6XpelBeLqIbLRlgFx7eDEp1vR5r/CvTs=;
	b=C9Uh0gB9ot6DVKwqUaGdgHtwoNCk51njU2oTC1H9rfxWmhgBP+yJOgJgWypRfPvrCyGHgd
	rwKoEwbe/NfS0/0287SnDkSNdG19RRG6/7yy4uXA22NSYyIvVKgVhzBtZACPfzLwjiOX9m
	B04Mtig59U8p7pk4lGENKy34cLEzCe8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-y4farI3-MmeUK49VnuRUYA-1; Mon, 30 Jan 2023 11:51:52 -0500
X-MC-Unique: y4farI3-MmeUK49VnuRUYA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD0EB3806635;
	Mon, 30 Jan 2023 16:51:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78128492B05;
	Mon, 30 Jan 2023 16:51:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 85F6419465A0;
	Mon, 30 Jan 2023 16:51:43 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1906A1946587 for <linux-audit@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 16:51:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ECA0540C2004; Mon, 30 Jan 2023 16:51:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.9.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C846940C2064;
 Mon, 30 Jan 2023 16:51:41 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux-audit@redhat.com, Anurag Aggarwal <anurag19aggarwal@gmail.com>
Subject: Re: Setting priority to auditd rule files
Date: Mon, 30 Jan 2023 11:51:41 -0500
Message-ID: <12149638.O9o76ZdvQC@x2>
Organization: Red Hat
In-Reply-To: <CAPoNrtu5eH8aPWkRTK+GkgddF=f_SVF3Pfi+WuHMafFxSdGTgw@mail.gmail.com>
References: <CAPoNrtu5eH8aPWkRTK+GkgddF=f_SVF3Pfi+WuHMafFxSdGTgw@mail.gmail.com>
MIME-Version: 1.0
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Monday, January 30, 2023 12:21:53 AM EST Anurag Aggarwal wrote:
> As per my understanding, currently auditd picks up rule files as per
> alphabetical order.

Auditd picks up the rules in /etc/audit/audit.rules  That in turn is compiled 
by augenrules which uses the order as given from "ls -v".

> Is there a way to force auditd to prioritize which rule file should be
> first read and applied, other than renaming it as 000-<app>.rules and
> hoping that customers don't have anything lexicographically smaller than
> this?

You can use "ls -v" to figure out how to make a rule that is ahead of 10-base-
config.rules. even 10-a.rule should go first. Or you can rename 10-base-
config.rules to be a higher number.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

