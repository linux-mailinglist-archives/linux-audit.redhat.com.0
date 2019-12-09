Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C164D117B45
	for <lists+linux-audit@lfdr.de>; Tue, 10 Dec 2019 00:13:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575933220;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sXs0cweqLiqLR/M1bxmd/JQpKVBhgBNzsSa3n2pvEuM=;
	b=RgXfpP9Fjsfuhd6qWAvMUiWy1JdZtC8X/Cm4U+5XSuiVDmFLRg2XdUBqWXKN5jsSOgUePl
	oX40THYnIcEcPsIhiOxXJBZIOLilwA1UOMsfrsFC79I+/yI4vMoniQNpJ9EU9cEjbZBgKc
	1WHhPjBWKCha9olnLCRB8UdR9mwIw/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-ndB8QneDOMesJcHkUHxmxQ-1; Mon, 09 Dec 2019 18:13:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 100391005512;
	Mon,  9 Dec 2019 23:13:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5B385D9D6;
	Mon,  9 Dec 2019 23:13:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0293165D2B;
	Mon,  9 Dec 2019 23:13:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9NDInF008150 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 18:13:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 464F7DBF11; Mon,  9 Dec 2019 23:13:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FB93DBF14
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 23:13:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 966A88CCD2A
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 23:13:13 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-137-Ezh1SFeBNsG7KQBvgZ9LYQ-1; Mon, 09 Dec 2019 18:13:10 -0500
Received: by mail-lf1-f67.google.com with SMTP id 15so12133836lfr.2
	for <linux-audit@redhat.com>; Mon, 09 Dec 2019 15:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9iqCmV8B8buco1LRLoG4l+riVC0C8+TxOU4n9PNGmJs=;
	b=DWibKOxkKDL1wiFBKpyUVnJHk39wcLvQM4l9rQ+7+44R5ioCwOBvUwxQTdsXOwM/Oy
	9yTjNBzc3It1fDufeTAx+TR8fQfgMET163aK/5qV8lAw7ni+axe8thvGEDq9CB+8JvGl
	neIWER/mkqiTPlxHGYMZ/aKt0cWy6nTRwjix5XIH5Gya5dx4DQ0ZtVB2sMKbFJfLUANx
	I8eNkdTbblQl9ZGPkJiqLhWT0XfeT0eQUBBewdLBWsf3Y2O/ZZUogBEQUPMCzJzVuB4M
	uCrbmHb2U4KXUx61gsHzbOaWxkOOlmgXe7T6TMEmnDOv4/YH2DRplqvgbur8FwxENzL3
	T8Gg==
X-Gm-Message-State: APjAAAVnWyG8TC0sw355PhE5o9sPgFLqPkJdIEmiw17oI7Zapk+0yl/g
	yG0wYLK2pT3m00jClc8Qh02aZFjswWEjNaA9VdSZ
X-Google-Smtp-Source: APXvYqxK8lT8+yxmtO2aK/Kxw6gT2abY7GDxhFOS0fW2Oaes5lOumRYTMsFywEd/1NbHsDj/1kBfAInstC24JzG8uy8=
X-Received: by 2002:a19:4a12:: with SMTP id x18mr13515294lfa.158.1575933188814;
	Mon, 09 Dec 2019 15:13:08 -0800 (PST)
MIME-Version: 1.0
References: <20191127170436.4237-1-sds@tycho.nsa.gov>
In-Reply-To: <20191127170436.4237-1-sds@tycho.nsa.gov>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Dec 2019 18:12:57 -0500
Message-ID: <CAHC9VhQ8nV3CQNzfQ+xW=kgcM3ZK_6+gg-DfhjVh5FuRON-Ppg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] security, lockdown,
	selinux: implement SELinux lockdown
To: Stephen Smalley <sds@tycho.nsa.gov>
X-MC-Unique: Ezh1SFeBNsG7KQBvgZ9LYQ-1
X-MC-Unique: ndB8QneDOMesJcHkUHxmxQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB9NDInF008150
X-loop: linux-audit@redhat.com
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, matthewgarrett@google.com,
	James Morris <jmorris@namei.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 27, 2019 at 12:04 PM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> Implement a SELinux hook for lockdown.  If the lockdown module is also
> enabled, then a denial by the lockdown module will take precedence over
> SELinux, so SELinux can only further restrict lockdown decisions.
> The SELinux hook only distinguishes at the granularity of integrity
> versus confidentiality similar to the lockdown module, but includes the
> full lockdown reason as part of the audit record as a hint in diagnosing
> what triggered the denial.  To support this auditing, move the
> lockdown_reasons[] string array from being private to the lockdown
> module to the security framework so that it can be used by the lsm audit
> code and so that it is always available even when the lockdown module
> is disabled.
>
> Note that the SELinux implementation allows the integrity and
> confidentiality reasons to be controlled independently from one another.
> Thus, in an SELinux policy, one could allow operations that specify
> an integrity reason while blocking operations that specify a
> confidentiality reason. The SELinux hook implementation is
> stricter than the lockdown module in validating the provided reason value.
>
> Sample AVC audit output from denials:
> avc:  denied  { integrity } for pid=3402 comm="fwupd"
>  lockdown_reason="/dev/mem,kmem,port" scontext=system_u:system_r:fwupd_t:s0
>  tcontext=system_u:system_r:fwupd_t:s0 tclass=lockdown permissive=0
>
> avc:  denied  { confidentiality } for pid=4628 comm="cp"
>  lockdown_reason="/proc/kcore access"
>  scontext=unconfined_u:unconfined_r:test_lockdown_integrity_t:s0-s0:c0.c1023
>  tcontext=unconfined_u:unconfined_r:test_lockdown_integrity_t:s0-s0:c0.c1023
>  tclass=lockdown permissive=0
>
> Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
> ---
>  include/linux/lsm_audit.h           |  2 ++
>  include/linux/security.h            |  2 ++
>  security/lockdown/lockdown.c        | 24 -----------------------
>  security/lsm_audit.c                |  5 +++++
>  security/security.c                 | 30 +++++++++++++++++++++++++++++
>  security/selinux/hooks.c            | 30 +++++++++++++++++++++++++++++
>  security/selinux/include/classmap.h |  2 ++
>  7 files changed, 71 insertions(+), 24 deletions(-)

While I remain concerned about the granularity, I think this is about
as good as we can get right now without potentially messing things up
in the future.  Applied to selinux/next, thanks Stephen.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

