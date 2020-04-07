Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E56DC1A1511
	for <lists+linux-audit@lfdr.de>; Tue,  7 Apr 2020 20:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586284954;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rINnQKl/VRWSe3N2vqiqmDhcZh+MCz2g6WaFZGGs4uw=;
	b=UEv28adbbQqhX1quhcXVo2SvChyyvashTGG2FgxbR80tMGYdjQyqA+rIWTNUunVXuA8VI/
	UXM5nGJpl3K5rzkXlvNVF0TDhByDLGgK22ONesIJFwnVZLrfhZNUGGgevzazU2hZijAvS5
	G/5BTZlvpBilhDbqX3r5W2STo6Qi+z8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-ZO2Uf3D7PbqmK2hjyNO9oA-1; Tue, 07 Apr 2020 14:42:32 -0400
X-MC-Unique: ZO2Uf3D7PbqmK2hjyNO9oA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E39678017F3;
	Tue,  7 Apr 2020 18:42:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DEF297AFB;
	Tue,  7 Apr 2020 18:42:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D6421803C32;
	Tue,  7 Apr 2020 18:42:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037IgLqm007908 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 14:42:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C27FC2166B27; Tue,  7 Apr 2020 18:42:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEA912166B2D
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:42:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F0C61017E45
	for <linux-audit@redhat.com>; Tue,  7 Apr 2020 18:42:16 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-152-gsVq4fAdOZapNo8j14Z57A-1; Tue, 07 Apr 2020 14:42:14 -0400
X-MC-Unique: gsVq4fAdOZapNo8j14Z57A-1
Received: by mail-pl1-f194.google.com with SMTP id g2so1571809plo.3
	for <linux-audit@redhat.com>; Tue, 07 Apr 2020 11:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=rGMO+JNuJTFMNu+IvjPr6Xa2QJ1yEqPcNRujwJ3PgYs=;
	b=n0FNS88ARgIRmvQNros1w3DR4fHOWLU5TmkzXPDm7DPK/4FRNxwqIKJyBvCQHA15dx
	GZ5Dp9ZlYH/X56Cass9yit0pihUDCBjpBvDjG3Ezzs4GNuQ342W1hnWKW+eDYocrnJ0f
	Mm1JCtMA1HkpIfX1E4byIQm9Qp7qItEZwtdmpUmT0IvWPyAusuSHqAJJL5SVI4C25079
	iX0yJLrUVYyNua8JiT4uGRL4OKMWikATruRYkWOUUNv+JnqXITxcUx3kI09TcXPh//R6
	JjdvHzpJnA/jO2wkFLSlSdlOJ1oM8EndntoDmbJfD4Aqbz0hEqYKLC5wTfeB5F7TYTos
	aiuw==
X-Gm-Message-State: AGi0Pua67uY4I3LVwkhvFTX01QMt5pDvyWLpdMAN2OrvdExCaDJUVMEy
	dVUqG9LtxJ3NzRkK4kU8CmGMWg==
X-Google-Smtp-Source: APiQypJ9IYIjuZzf0qtFv2N2USEg/IgxVpKnFdgp2UHq75sWRA3RZIXomTD7OPyoLqzRN5K30gxO1Q==
X-Received: by 2002:a17:902:a411:: with SMTP id
	p17mr3730363plq.157.1586284932978; 
	Tue, 07 Apr 2020 11:42:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	p22sm14034306pgn.73.2020.04.07.11.42.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Apr 2020 11:42:12 -0700 (PDT)
Date: Tue, 7 Apr 2020 11:42:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v16 19/23] LSM: Verify LSM display sanity in binder
Message-ID: <202004071142.C3250D5@keescook>
References: <20200407000159.43602-1-casey@schaufler-ca.com>
	<20200407000159.43602-20-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20200407000159.43602-20-casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 037IgLqm007908
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, sds@tycho.nsa.gov
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
Content-Disposition: inline

On Mon, Apr 06, 2020 at 05:01:55PM -0700, Casey Schaufler wrote:
> Verify that the tasks on the ends of a binder transaction
> use the same "display" security module. This prevents confusion
> of security "contexts".
> 
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  security/security.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/security/security.c b/security/security.c
> index 84f33bd4990a..b7c2ed1eee42 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -769,9 +769,38 @@ int security_binder_set_context_mgr(struct task_struct *mgr)
>  	return call_int_hook(binder_set_context_mgr, 0, mgr);
>  }
>  
> +/**
> + * security_binder_transaction - Binder driver transaction check
> + * @from: source of the transaction
> + * @to: destination of the transaction
> + *
> + * Verify that the tasks have the same LSM "display", then
> + * call the security module hooks.
> + *
> + * Returns -EINVAL if the displays don't match, or the
> + * result of the security module checks.
> + */
>  int security_binder_transaction(struct task_struct *from,
>  				struct task_struct *to)
>  {
> +	int from_display = lsm_task_display(from);
> +	int to_display = lsm_task_display(to);
> +
> +	/*
> +	 * If the display is LSMBLOB_INVALID the first module that has
> +	 * an entry is used. This will be in the 0 slot.
> +	 *
> +	 * This is currently only required if the server has requested
> +	 * peer contexts, but it would be unwieldly to have too much of
> +	 * the binder driver detail here.
> +	 */
> +	if (from_display == LSMBLOB_INVALID)
> +		from_display = 0;
> +	if (to_display == LSMBLOB_INVALID)
> +		to_display = 0;
> +	if (from_display != to_display)
> +		return -EINVAL;
> +
>  	return call_int_hook(binder_transaction, 0, from, to);
>  }
>  
> -- 
> 2.24.1
> 

-- 
Kees Cook


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

