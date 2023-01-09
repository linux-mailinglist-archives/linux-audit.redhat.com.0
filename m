Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6971C662AA9
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 16:59:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673279971;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SyglVsCH2e6/dyJk3VrPsDgU2K8QE52LtO/7Yg4GHdY=;
	b=Mcj/5I6uvmEOOI1bQuJ0Wc8UewhXQ1QpNy8+eykLvdpAY1ODgT9XmQVHEtD7YbV/G3SKhd
	Yai/U7K/Da8D1T4qLVOgwWvAKLgx/CE8c6pXmUrLj6naUUXPInvS7pawbE5dQQc8DJ29/F
	gE4MOeuJqWrEcDreakFFEkIaV/z0l4c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-zoUzRcqKPjybHP2ita1EWQ-1; Mon, 09 Jan 2023 10:59:29 -0500
X-MC-Unique: zoUzRcqKPjybHP2ita1EWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C38EC857A93;
	Mon,  9 Jan 2023 15:59:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5947042220;
	Mon,  9 Jan 2023 15:59:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF3F51946587;
	Mon,  9 Jan 2023 15:59:25 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E31471946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 15:59:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C81FE2026D68; Mon,  9 Jan 2023 15:59:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.32.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C6BA2026D4B;
 Mon,  9 Jan 2023 15:59:23 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: A question on monitoring time or time management changes in the
 kernel and the adjtimex system call
Date: Mon, 09 Jan 2023 10:35:59 -0500
Message-ID: <1921775.PYKUYFuaPT@x2>
Organization: Red Hat
In-Reply-To: <67cb9316477478e1bf04dd65ab90e9171795433d.camel@iinet.net.au>
References: <67cb9316477478e1bf04dd65ab90e9171795433d.camel@iinet.net.au>
MIME-Version: 1.0
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Monday, January 9, 2023 2:33:39 AM EST Burn Alting wrote:
> Would it be correct to say that when one sees an adjtimex system call audit
> event, a change has occurred ONLY if either a AUDIT_TIME_ADJNTPVAL
> (algorithm change) or AUDIT_TIME_INJOFFSET (time change) record is present
> in the event?

I think if you see either, time has been changed. I haven't studied the 
syscall to see if there isn't a sneak path, but I think they can be relied 
on.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

