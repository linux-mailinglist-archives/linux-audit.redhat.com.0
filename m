Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6E27E17CA9C
	for <lists+linux-audit@lfdr.de>; Sat,  7 Mar 2020 03:01:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583546515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fE8oeFFgUP1CV1QVhCr6RM0YtUzgHFhYxvm+R3Ai+7E=;
	b=gi/X3Qj47kWhHxokDparhzCxzW1zZPkiD05WkzTVc4vqWmScN3bFfWnIJhPGj3aTWqk8ix
	rzHcBDVjrT360i8fPBIWYjBaflpIOyceWGp0zO2tYDx/13F6v6LA2UPVl9bWFcD5Yc8Pl/
	qZY11F6CtJVmazrzRFX5+TJRIBzGILM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-I0wyLPndPxOnWAFZKlw-uQ-1; Fri, 06 Mar 2020 21:01:52 -0500
X-MC-Unique: I0wyLPndPxOnWAFZKlw-uQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B671E800EBC;
	Sat,  7 Mar 2020 02:01:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A377E5D9CD;
	Sat,  7 Mar 2020 02:01:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6227818089CD;
	Sat,  7 Mar 2020 02:01:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02721Ztr016196 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 21:01:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 72F07208BDC3; Sat,  7 Mar 2020 02:01:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DFC62026D68
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 02:01:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01D768BA502
	for <linux-audit@redhat.com>; Sat,  7 Mar 2020 02:01:33 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-89-Yfyi_QEvOoutH6qrHkfKfw-1; Fri, 06 Mar 2020 21:01:30 -0500
X-MC-Unique: Yfyi_QEvOoutH6qrHkfKfw-1
Received: by mail-ed1-f67.google.com with SMTP id m25so4718744edq.8
	for <linux-audit@redhat.com>; Fri, 06 Mar 2020 18:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZJXWA21SYbtNGggfBOtj9wxR6fj8zYLBKZQ8cELF4M0=;
	b=I8kzRfq7J69TPbNZaEqK12TBN0ekrJcCHEFo5Km8kLZO1TGvpMrNCiUSoSCkaiyV7Q
	s9FfLh5kQq5QLrSrXo9veBqnNx/ZnbbTZRRp/MwdOUjSuPJye+YqwX+MDC65BGIQ6SQG
	37JS8Uhz89l35B8NbpuXUSeZLaFWxFAo6kcVNd/QwKoKQKS2E4MbbBLGUia7b9InJRGd
	NVnhYLvWOWIK8Qt1JEIfV12y0pNvpQB/YZ2x6V0UgkPrerDaSxcSw04JjjJaYII3IhEl
	R8aRECym+6IyGt4R2/GbVO/njDFceXgukDVpVSfUuwS2UgXsy6AEcstrFqQvFEt/zDFm
	muVg==
X-Gm-Message-State: ANhLgQ3rGA5qwIZifO8/jS4zVIj/hOZe0Kdm0f6VCLChogAfT29jkEmo
	Oya2pAj3vhoUBEekVxPjdLHeacy9QxoJFKyS0lo673g=
X-Google-Smtp-Source: ADFU+vs9IPKhzr+9YExCXhXZjLCa+3n5Xi2eEabxiaJ0E2ZkQkBA1xJOWk7TL0KDZp9+7RPSLlughlGCjCjg150NKRs=
X-Received: by 2002:a50:e108:: with SMTP id h8mr5926336edl.196.1583546489411; 
	Fri, 06 Mar 2020 18:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey@schaufler-ca.com>
	<20200222000407.110158-12-casey@schaufler-ca.com>
In-Reply-To: <20200222000407.110158-12-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Mar 2020 21:01:18 -0500
Message-ID: <CAHC9VhQMCxfPPUQPfY2p5kD=xatD4UFLZNoPaOns+-Ld2k7y=w@mail.gmail.com>
Subject: Re: [PATCH v15 15/23] LSM: Use lsmcontext in security_secid_to_secctx
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02721Ztr016196
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 21, 2020 at 7:06 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Replace the (secctx,seclen) pointer pair with a single
> lsmcontext pointer to allow return of the LSM identifier
> along with the context and context length. This allows
> security_release_secctx() to know how to release the
> context. Callers have been modified to use or save the
> returned data from the new structure.
>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: netdev@vger.kernel.org
> ---
>  drivers/android/binder.c                | 26 +++++++---------
>  include/linux/security.h                |  4 +--
>  include/net/scm.h                       | 10 ++-----
>  kernel/audit.c                          | 35 ++++++++--------------
>  kernel/auditsc.c                        | 31 +++++++------------
>  net/ipv4/ip_sockglue.c                  |  7 ++---
>  net/netfilter/nf_conntrack_netlink.c    | 14 +++++----
>  net/netfilter/nf_conntrack_standalone.c |  7 ++---
>  net/netfilter/nfnetlink_queue.c         |  5 +++-
>  net/netlabel/netlabel_unlabeled.c       | 40 ++++++++-----------------
>  net/netlabel/netlabel_user.c            |  7 ++---
>  security/security.c                     | 10 +++++--
>  12 files changed, 76 insertions(+), 120 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

