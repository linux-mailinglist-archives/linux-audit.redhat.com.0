Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FE270F8F7
	for <lists+linux-audit@lfdr.de>; Wed, 24 May 2023 16:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684939486;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aLQE337BxShErNOkK9Q6wjVoZT/uCOQnqqxni4h0fq4=;
	b=Y24EJTp2cl8YTUWXV2kfQdf5aJhZ48TXRz6h7e5TIWj+5jJJeaGxY7cw024cQ5Ekel/vlz
	6S2pSwyvP26wAIpYj0zvB0ErFnx7Pja/PbnMM0o2zBNzGylMCQ6Vse2vdznxpD+Qj9etRL
	6B/OM7LMK33ptERFadsog2BPtq7A1D8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-g31iFDG_OE2GU6mr4_jU0Q-1; Wed, 24 May 2023 10:44:42 -0400
X-MC-Unique: g31iFDG_OE2GU6mr4_jU0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF1081C05122;
	Wed, 24 May 2023 14:44:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BFB0140E96D;
	Wed, 24 May 2023 14:44:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 620BC19465B9;
	Wed, 24 May 2023 14:44:32 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 57F3B19465A0 for <linux-audit@listman.corp.redhat.com>;
 Wed, 24 May 2023 14:42:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 242BA407DEC6; Wed, 24 May 2023 14:42:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (unknown [10.22.34.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F4133407DEC3;
 Wed, 24 May 2023 14:42:04 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Linux Audit <linux-audit@redhat.com>
Subject: Re: No more report of quantity of rules successfully loaded
Date: Wed, 24 May 2023 10:42:04 -0400
Message-ID: <4811240.GXAFRqVoOG@x2>
Organization: Red Hat
In-Reply-To: <CAJdJdQnpmK3uN7R_CNQs3+HdLKfswgQpqT95+O0_Bawc7zMKHw@mail.gmail.com>
References: <CAJdJdQnpmK3uN7R_CNQs3+HdLKfswgQpqT95+O0_Bawc7zMKHw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Warron,

On Tuesday, May 23, 2023 7:12:07 PM EDT warron.french wrote:
> Hi, I am running auditd-3.0.7-4 on an Alma Linux v8.8.
> 
> I know that for all of RHEL 6 and RHEL 7 variants that I worked with, to
> include CentOS (not Stream) that after I rebooted a server or restarted the
> auditd service (with -e 1 set) that I would 100% of the time get a report
> in /var/log/messages about the quantity of rules that successfully loaded.

It has never done that unless someone else has a patch they did not send 
upstream.

> I could compare that to my unified rules file
> (/etc/audit/rules.d/Unified.rules - for a reference) and strip out the
> typical for auditd Control rules (-D, -e 1, -f 1, -b, -r, for examples) and
> then assess if I had the full set of files loaded or not.
> 
> With this implementation of auditd, on version 3.0.7-4, I am not getting
> those results anymore.
> Am I looking in the wrong place, because for me this is important
> information?

It has never done that. auditctl -D gives the output of auditctl -s as a 
convenience. But auditctl -s has never reported how many rules are loaded. I 
don't think the kernel has a counter. It has a variable for if any rules are 
loaded, but not the quantity.

> Yes, I know that I can also manually execute "auditctl -l  | wc -l" and get
> that information  too, but I was wondering if this is planned or if I am
> looking in the wrong place, or what to do.

It has never done that and is not planned.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

