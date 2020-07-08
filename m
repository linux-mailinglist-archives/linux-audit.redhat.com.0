Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1532A219385
	for <lists+linux-audit@lfdr.de>; Thu,  9 Jul 2020 00:34:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-Jzo1BWV2M2Wstke7j3Uwlw-1; Wed, 08 Jul 2020 18:34:34 -0400
X-MC-Unique: Jzo1BWV2M2Wstke7j3Uwlw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4E13802780;
	Wed,  8 Jul 2020 22:34:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13E3A5D9DD;
	Wed,  8 Jul 2020 22:34:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84CD8180954D;
	Wed,  8 Jul 2020 22:34:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068MRTmQ016534 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 18:27:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58D291102E0C; Wed,  8 Jul 2020 22:27:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC3BB1104E6E
	for <linux-audit@redhat.com>; Wed,  8 Jul 2020 22:27:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DD4D8EF3A1
	for <linux-audit@redhat.com>; Wed,  8 Jul 2020 22:27:24 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-382-uAHnpYRLPe27SLXaA9IAMw-1; Wed, 08 Jul 2020 18:27:22 -0400
X-MC-Unique: uAHnpYRLPe27SLXaA9IAMw-1
Received: by mail-ej1-f67.google.com with SMTP id dp18so129107ejc.8
	for <linux-audit@redhat.com>; Wed, 08 Jul 2020 15:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M3CJ5AkQEOPgCtVjox2BEo7zZTUcB1g6AUdNDrislks=;
	b=hjAs0MqhJYGcHj/iGiROu0QCMFxFfrlY2c2P4ZlzezhnqIQvZaoMpThANxG8lDL06y
	gDJolU0gfLmuqEfAviPQWZHC6godfJeVKSu2sE9MhL5S5XPDICnPMFTkUuMo08ARKBQG
	56v++CqhD561Pg1sRYixrRvtzOaLgefzJ3uCkWSnqVlNOLYSkvR9LImjp+AfXu6e0c2Y
	OTyEzm5wE5ES+v6b++7jdyFq3G0eHXDvcmpH8TQXlTIMhiKUEUV13oyi8mCJNlc+iGOW
	5gdtLCu8zsYUXzE2PvgI11LGeZdvaumR2SN68aj9CD5NgVT39XlTjK8Z38lzcBiEmcbh
	zJSQ==
X-Gm-Message-State: AOAM531/EjaTcwucHI57B6RqDMcX5sjBvjkV36jDrGW3PK1wgw9P2Y5l
	krQzcC28FsKqfGwGbrfRB3jtwRBHalr8PVlDQKKX
X-Google-Smtp-Source: ABdhPJzB+/J71xUafKgkFpZ97jdj5CfyFcTng+kyUSwgIbEmbgV3ILMKYWcFKxMVPcN1xATY3ewRxSUsiyZE1XDyvA0=
X-Received: by 2002:a17:906:4757:: with SMTP id
	j23mr26607711ejs.431.1594247240854; 
	Wed, 08 Jul 2020 15:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <159378341669.5956.13490174029711421419.stgit@sifl>
	<20200703202557.tm6o33uignjpmepa@madcap2.tricolour.ca>
In-Reply-To: <20200703202557.tm6o33uignjpmepa@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Jul 2020 18:27:09 -0400
Message-ID: <CAHC9VhQzUht4MGh1KNyb3K+zMqKbm_YKPWKL1_f8ONeWn6DBFQ@mail.gmail.com>
Subject: Re: [PATCH] audit: use the proper gfp flags in the audit_log_nfcfg()
	calls
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	Jones Desougi <jones.desougi+netfilter@gmail.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 3, 2020 at 4:26 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> On 2020-07-03 09:36, Paul Moore wrote:
> > Commit 142240398e50 ("audit: add gfp parameter to audit_log_nfcfg")
> > incorrectly passed gfp flags to audit_log_nfcfg() which were not
> > consistent with the calling function, this commit fixes that.
> >
> > Fixes: 142240398e50 ("audit: add gfp parameter to audit_log_nfcfg")
> > Reported-by: Jones Desougi <jones.desougi+netfilter@gmail.com>
> > Signed-off-by: Paul Moore <paul@paul-moore.com>
>
> Looks good to me.  For what it's worth:

Thanks, applied to audit/next.  Also, for the record, reviews are
always welcome; I really dislike merging my own patches without
reviews.  Sometimes it needs to be done to fix a serious fault, build
error, etc. but in general I'm of the opinion that maintainer patches
should be treated just the same as any other patch.

> Reviewed-by: Richard Guy Briggs <rgb@redhat.com>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

