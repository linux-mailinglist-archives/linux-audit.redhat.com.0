Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E296E247B8E
	for <lists+linux-audit@lfdr.de>; Tue, 18 Aug 2020 02:39:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-SBYXqgjCPGOhrzTo0hkSRw-1; Mon, 17 Aug 2020 20:39:25 -0400
X-MC-Unique: SBYXqgjCPGOhrzTo0hkSRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BA501DDED;
	Tue, 18 Aug 2020 00:39:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF078756AB;
	Tue, 18 Aug 2020 00:39:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECAED60344;
	Tue, 18 Aug 2020 00:39:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07I0dFCq004426 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 20:39:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CBEDA86D75; Tue, 18 Aug 2020 00:39:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C75238287E
	for <linux-audit@redhat.com>; Tue, 18 Aug 2020 00:39:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B97EE803DCC
	for <linux-audit@redhat.com>; Tue, 18 Aug 2020 00:39:11 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-14-ckkulWFXOtW4YdqA1fMupQ-1; Mon, 17 Aug 2020 20:39:09 -0400
X-MC-Unique: ckkulWFXOtW4YdqA1fMupQ-1
Received: by mail-ej1-f68.google.com with SMTP id kq25so19996775ejb.3
	for <linux-audit@redhat.com>; Mon, 17 Aug 2020 17:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IJPXrsCipqi0H0PMMRI1mohpgVa4NcRS8gKWHziQUus=;
	b=J6umUMfd+JdOpSbtqlAPgU3VzoJf7vd3lBz/jUt/O/laP1YuIuDIgbmC0lN9oeugtx
	kMsYrHbLbp0yeqVNWEPhN6V7MP5uZW7q0mDBeN5b2LGWwAbClx+hQZQzxj74lw5vBQHt
	4O8wiUtH9o7VgM/exJrFs3683ckMW0s9vPDf15CgcWbH9lFoWTvesyvpDrJLEpVCshDj
	hHts/7cSoFEVXFceriQBW+RJsT+vCgMmV9BblJpkOlMRDvOfnp9WMV/G2X152Dj+gSOw
	M3P2PBAhY/cy7qSz0TUpSHy1zdzzma6nLblmDgCT0it4CUN4rOqjFDKbba2UDPhHDSaK
	428Q==
X-Gm-Message-State: AOAM531/P9GGd+Nvg+V4s8JNhd6qdo0pCmmrjf2anxIHjQOmm+IThy5S
	6lD3la8BSBJ4yJkrldXAfyw94NHTSRJGIWI4AcT8v01h/RBK
X-Google-Smtp-Source: ABdhPJyrTNshDf16Hm284AG1Fr2Wyi4JN3NzpZBgdhKWzY01mT51/NxdVP/rC0P8NQyveTJxxGdcT8E4RwMnm9plb1A=
X-Received: by 2002:a17:906:7c86:: with SMTP id
	w6mr17381043ejo.178.1597711148230; 
	Mon, 17 Aug 2020 17:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200803123439.83400-1-jbi.octave@gmail.com>
	<20200803123439.83400-3-jbi.octave@gmail.com>
	<CAHC9VhQA0JZNLZbfUUecrTbMvnD3S7sRMOAoW5eeeK-jpZeEWw@mail.gmail.com>
In-Reply-To: <CAHC9VhQA0JZNLZbfUUecrTbMvnD3S7sRMOAoW5eeeK-jpZeEWw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 17 Aug 2020 20:38:57 -0400
Message-ID: <CAHC9VhQqD52AzrYghidj+Bj9eMpFOZSxZxXw7rYPGa5U59xB+Q@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/2] audit: uninitialize variable audit_sig_sid
To: Jules Irenge <jbi.octave@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: "moderated list:AUDIT SUBSYSTEM" <linux-audit@redhat.com>,
	linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 6, 2020 at 2:35 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Mon, Aug 3, 2020 at 8:35 AM Jules Irenge <jbi.octave@gmail.com> wrote:
> >
> > Checkpatch tool reports
> >
> > "ERROR: do not initialise globals/statics to 0"
> >
> > To fix this, audit_sig_sid is uninitialized
> > As this is stored in the .bss section,
> > the compiler can initialize the variable automatically.
> >
> > Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> > ---
> >  kernel/audit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Similar to patch 1/2, this will need to wait until after the merge
> window closes.

... also merged this patch into audit/next.  Thanks again.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

