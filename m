Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 00D2D1EC621
	for <lists+linux-audit@lfdr.de>; Wed,  3 Jun 2020 02:16:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591143418;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2oYpAdjKb05QPFijbWHMArS8GvufOM+CvoQs1L0yJ1A=;
	b=WQORboBdEw4mdC13ePEa/E/K6ehoBq0BAjwH3Q8dsBalzeQZ4c4nXNZXxPQyTOp2MC7J/e
	KU/PFgrfTxsCM5f0yxi67AdJ+dmKiiMMWbWiLjS4HKXzrwjkgDH3bwn5QC+9IVc4tSy//L
	ipnvYC82fX1ikvJax5HhEA+YIOUvQ4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-GplAil0YODmrm1pOOXojCw-1; Tue, 02 Jun 2020 20:16:56 -0400
X-MC-Unique: GplAil0YODmrm1pOOXojCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A0B88018AC;
	Wed,  3 Jun 2020 00:16:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5C6C7F0B5;
	Wed,  3 Jun 2020 00:16:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45A5F97020;
	Wed,  3 Jun 2020 00:16:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0530GPhK030130 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 20:16:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD1B5202683E; Wed,  3 Jun 2020 00:16:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D76402026D67
	for <linux-audit@redhat.com>; Wed,  3 Jun 2020 00:16:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F0468007A4
	for <linux-audit@redhat.com>; Wed,  3 Jun 2020 00:16:17 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1-E-qJuByyOhurYOSb4ctqAA-1; Tue, 02 Jun 2020 20:16:14 -0400
X-MC-Unique: E-qJuByyOhurYOSb4ctqAA-1
Received: by mail-lj1-f193.google.com with SMTP id m18so474431ljo.5
	for <linux-audit@redhat.com>; Tue, 02 Jun 2020 17:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P8hJYQ+rT235Ea6JWRxsMjDChbaKBs3WgPV6XuNeVEM=;
	b=XjgDdjVRxf2HbWdP5IBNEtkdJTecVIil0OKJzY4cyUykYR3hYH9RHEW2FMwTkb17vu
	Bq1P4EmvO6+jKr7F6cMLXP28HgTi+vvK29THajI70LaWfjgVrlW9aDm7UpjSkSkyYcIc
	6I73quSLUYxgvMEx8SF8MfVOYFu28rXko6CcRsmU+aBYrIgelCGyWmMxpPj6UyefEidi
	yOhhmt3kAPdlSHaHL/77nSgkSGBI1dPEtl0kyL47UOrErEffGvWuF47mdunf4gw7Z15p
	YjNZ5hmsjGp0FxLf6LYr8n9hsYmyvihaPjooW2eP9Fj7KnlF/yLrNyL2GfvOUE+Rjx0n
	Avhg==
X-Gm-Message-State: AOAM532J6g0eWbjH5Dd/pfLWvdIu4oueYVlHCj6yL72GP9+eygL6WET5
	gn46/aXyImZbHKroJGDPZOZQ31rL100=
X-Google-Smtp-Source: ABdhPJy7MYUf49oteq4H6d7Ky3Szwq7gNdPO4DYLViZshBajhw2qXbaL3ClWCt/frR50dSjiq5Yc7g==
X-Received: by 2002:a2e:9cd8:: with SMTP id g24mr743490ljj.438.1591143372816; 
	Tue, 02 Jun 2020 17:16:12 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
	[209.85.208.179])
	by smtp.gmail.com with ESMTPSA id y199sm153428lff.6.2020.06.02.17.16.11
	for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 02 Jun 2020 17:16:12 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id c11so497052ljn.2
	for <linux-audit@redhat.com>; Tue, 02 Jun 2020 17:16:11 -0700 (PDT)
X-Received: by 2002:a2e:b5d7:: with SMTP id g23mr681936ljn.70.1591143371526;
	Tue, 02 Jun 2020 17:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhQqnAG5DxvoQKa643d06rDTVtHVFEj5arCsHwyoamCckA@mail.gmail.com>
In-Reply-To: <CAHC9VhQqnAG5DxvoQKa643d06rDTVtHVFEj5arCsHwyoamCckA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jun 2020 17:15:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgzabBsjeGyjE9jHDiLT+CbCYhkLq8xUyWemue2zohrew@mail.gmail.com>
Message-ID: <CAHk-=wgzabBsjeGyjE9jHDiLT+CbCYhkLq8xUyWemue2zohrew@mail.gmail.com>
Subject: Re: [GIT PULL] Audit patches for v5.8
To: Paul Moore <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 1, 2020 at 5:49 PM Paul Moore <paul@paul-moore.com> wrote:
>
>       Unfortunately I just noticed
> that one of the commit subject lines is truncated - sorry about that,
> it's my fault not Richard's - but since the important part is there
> ("add subj creds to NETFILTER_CFG") I opted to leave it as-is and not
> disrupt the git log.  If you would rather have the subject line fixed,
> let me know and I'll correct it.

It looks a bit odd, but not worth the churn of fixing up. Thanks, pulled,

                  Linus

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

