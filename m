Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFFE17C768
	for <lists+linux-audit@lfdr.de>; Fri,  6 Mar 2020 21:56:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583528172;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e0RXFdJyz2eros6T/Ab4lVYYAmuOrsGCeJ29ntOAci4=;
	b=b1cPco2AQubp6dyrWhUxNUxW1Qg0xJs59JCOKNHXZLbKRjdxyns/sc013c4/N0aR2CeHLV
	bgBSct6o486E/kd44KlSAVm1VkhL1fgRAR+MkfNzDEIDSooPusoGVmBN+bk3bk3pcrzMbK
	Bycv+M5lE9EmTprO8NRiO+Bu6N/QdDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-r-csOdsENO60a_2LaARxyA-1; Fri, 06 Mar 2020 15:56:10 -0500
X-MC-Unique: r-csOdsENO60a_2LaARxyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AB7318A8C82;
	Fri,  6 Mar 2020 20:56:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F19291D97;
	Fri,  6 Mar 2020 20:56:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 346D284484;
	Fri,  6 Mar 2020 20:55:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026KtfpO006494 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 15:55:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 991531649C7; Fri,  6 Mar 2020 20:55:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94CB91649C8
	for <linux-audit@redhat.com>; Fri,  6 Mar 2020 20:55:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB49D185A793
	for <linux-audit@redhat.com>; Fri,  6 Mar 2020 20:55:38 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-418-iGAzrselMamdYnMV3WAcIg-1; Fri, 06 Mar 2020 15:55:36 -0500
X-MC-Unique: iGAzrselMamdYnMV3WAcIg-1
Received: by mail-ed1-f66.google.com with SMTP id g19so4039643eds.11
	for <linux-audit@redhat.com>; Fri, 06 Mar 2020 12:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HXklg5udbwgb5zR0Xtaep74c0PStoW6hshKSPDA1cy4=;
	b=LFnAbvsTDK6yY3/WCQoJrMXsO+1Q1JYQMRW1Y65kc6GuZsHl8kxwYvqacomvD7L/fC
	hgcLLQWmgjQy25TlvboOnhLVFXmdvYR6mJsAnNDuQXK3epPaQy1JmTTlvf+Jrt7vNfeH
	r509EtlmsG9M4dFSf87i0QwE0IxjngzkOO6hPPtG5RwL2RV9f7teiwfcYYCm9syrUI1V
	5QFRog3DsoVMFEVj5XUCDxYZ6fhYVtT7k1521BURApsIxwPeMJIoxPNiM/aHmkxCZKeJ
	p9v3YAKDKIVGxPBnovAM2YginKod4zNCg5tnHuDAmuELdHV9uh6Bt6QJB4IoyzfXMBob
	P34g==
X-Gm-Message-State: ANhLgQ2w5wfrarZk/eFP8AjM6Z4nS29qiPLxsOJMYOZTWrzqnbOEeNYE
	kY0ArcNoZNh8az4zxYxXHkB8YTOL7Nz0muF/8LBLO5g=
X-Google-Smtp-Source: ADFU+vvFuRsWiVfztHVjsoN0QooOjvoLXVSOJAfAZ4rYpQ0y6e0jZcKTyOe9nFIO9mnYNkePyPW8rIdBxnQfrrKr4rw=
X-Received: by 2002:a17:906:52c9:: with SMTP id
	w9mr4762420ejn.70.1583528135186; 
	Fri, 06 Mar 2020 12:55:35 -0800 (PST)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-3-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-3-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Mar 2020 15:55:24 -0500
Message-ID: <CAHC9VhTMNYWrwWNdS6NjL3ZF+4+BsNB-hAKRE759_bunajOOGg@mail.gmail.com>
Subject: Re: [PATCH v15 02/23] LSM: Create and manage the lsmblob data
	structure.
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 026KtfpO006494
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2020 at 7:05 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> When more than one security module is exporting data to
> audit and networking sub-systems a single 32 bit integer
> is no longer sufficient to represent the data. Add a
> structure to be used instead.
>
> The lsmblob structure is currently an array of
> u32 "secids". There is an entry for each of the
> security modules built into the system that would
> use secids if active. The system assigns the module
> a "slot" when it registers hooks. If modules are
> compiled in but not registered there will be unused
> slots.
>
> A new lsm_id structure, which contains the name
> of the LSM and its slot number, is created. There
> is an instance for each LSM, which assigns the name
> and passes it to the infrastructure to set the slot.
>
> The audit rules data is expanded to use an array of
> security module data rather than a single instance.
> Because IMA uses the audit rule functions it is
> affected as well.
>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/audit.h               |  4 +-
>  include/linux/lsm_hooks.h           | 12 ++++-
>  include/linux/security.h            | 66 ++++++++++++++++++++++++--
>  kernel/auditfilter.c                | 27 ++++++-----
>  kernel/auditsc.c                    | 12 ++---
>  security/apparmor/lsm.c             |  7 ++-
>  security/commoncap.c                |  7 ++-
>  security/integrity/ima/ima_policy.c | 34 +++++++++-----
>  security/loadpin/loadpin.c          |  8 +++-
>  security/lockdown/lockdown.c        |  7 ++-
>  security/safesetid/lsm.c            |  8 +++-
>  security/security.c                 | 72 ++++++++++++++++++++++++-----
>  security/selinux/hooks.c            |  8 +++-
>  security/smack/smack_lsm.c          |  7 ++-
>  security/tomoyo/tomoyo.c            |  8 +++-
>  security/yama/yama_lsm.c            |  7 ++-
>  16 files changed, 238 insertions(+), 56 deletions(-)

Heads-up that there is likely to be some merge fuzz in
kernel/auditfilter.c; I just had to fix some of the code you are
touching (it is in Linus' tree).  The merge should be trivial, but if
you are uncertain let me know.

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

