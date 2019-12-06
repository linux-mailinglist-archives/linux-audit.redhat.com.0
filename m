Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 032D01158A8
	for <lists+linux-audit@lfdr.de>; Fri,  6 Dec 2019 22:31:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575667861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UiZraXthcgUsJs5jTG7qoeV1DdnsRBJFFVoLDwPZDGM=;
	b=QgauhBVtmB/X54foskLn9Dq3BZ9wn5IM2NMwv+VVCesSSj34XxyEvp2fP5gDcYmXJJmfok
	bH9UDCr3Oz03d1GmOmtwqKhk9VMY+Ax89CcsoSvyQrW53Ui8lf3dLmvuvQHM840/YXeQhL
	fuGZ0Jgj7UeDu5mvcAxTUEb65lI77io=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-ZJ6q-2i4PmGO05pRtRMoxg-1; Fri, 06 Dec 2019 16:30:58 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEED2800D54;
	Fri,  6 Dec 2019 21:30:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD70B5D9C9;
	Fri,  6 Dec 2019 21:30:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E3821809567;
	Fri,  6 Dec 2019 21:30:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB6LUood014258 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 6 Dec 2019 16:30:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 043E01005437; Fri,  6 Dec 2019 21:30:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F357C10926DB
	for <linux-audit@redhat.com>; Fri,  6 Dec 2019 21:30:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66C69803B56
	for <linux-audit@redhat.com>; Fri,  6 Dec 2019 21:30:47 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-203-jdsZx5wdPQSaN_N2_wVpZQ-1; Fri, 06 Dec 2019 16:30:43 -0500
Received: by mail-lj1-f172.google.com with SMTP id m6so9205302ljc.1
	for <linux-audit@redhat.com>; Fri, 06 Dec 2019 13:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k0AxtQz+D7li61OwD0X5pV6PAQ8uw+d579qmg3IG/Sc=;
	b=Z/9r0LIqMO3pnh7zNutPgjhdfoVgbW8lxo4Bgbmx4osftC93cDN0AL/QZ/paUzVloi
	VRGREmLIijeVp5A+D3GKmuCW/PDcFbbVD5Xp1p9zeYKPxxbRJ6g+oevV664Qj5P8DNST
	1VkC8oGTpDm5GFJXRa0krjxE+HLWAXDJycMU24RJ2M3lSHXqUpzk89uan26KiiucioDP
	/fJ9lrnKkoBwr2/eSdTINWMvWcS5C1KSfQenmNtQqDun+YG88lBqCwNXAi1AUz9LwK7W
	WFlVybIDAGswxD0NTbegLP6Jn6jEGdzi5d7/a1cjwhCbMBfuUGN3fY93lLDI2XOwB98i
	eG4A==
X-Gm-Message-State: APjAAAV9laQBGiPapkQ89despGeFvx/KUzK7zEqcTEb0fXnxDY61TwR0
	hU4jmfzEBim8X3ZIcr6ylXKEEEGJ1p7JwWmNRnAF
X-Google-Smtp-Source: APXvYqyZoE3a2k8tZCPJpj4lF4MwO9mGx9MdBNu06QbG8u9mHXKSYb/POTKAfMu4sAUc1UjlBg8/cUDFd3qgiyCR00Y=
X-Received: by 2002:a2e:4704:: with SMTP id u4mr9986759lja.117.1575667841756; 
	Fri, 06 Dec 2019 13:30:41 -0800 (PST)
MIME-Version: 1.0
References: <20191205102552.19407-1-jolsa@kernel.org>
	<CAHC9VhTWnNvfMAPz-WhD9Wqv6UZZDBdMxF9VuS3UeTLHLtfhHw@mail.gmail.com>
	<20191206212746.GA30691@krava>
In-Reply-To: <20191206212746.GA30691@krava>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Dec 2019 16:30:30 -0500
Message-ID: <CAHC9VhRv8dTXt0e9L16KXdCTs8E-fFym5tWq8y0dqPT0ghgKgw@mail.gmail.com>
Subject: Re: [PATCHv2] bpf: Emit audit messages upon successful prog load and
	unload
To: Jiri Olsa <jolsa@redhat.com>
X-MC-Unique: jdsZx5wdPQSaN_N2_wVpZQ-1
X-MC-Unique: ZJ6q-2i4PmGO05pRtRMoxg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB6LUood014258
X-loop: linux-audit@redhat.com
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Jiri Benc <jbenc@redhat.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
	Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>
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

On Fri, Dec 6, 2019 at 4:28 PM Jiri Olsa <jolsa@redhat.com> wrote:
> On Fri, Dec 06, 2019 at 04:11:13PM -0500, Paul Moore wrote:
> > Other than that, this looks good to me, and I see Steve has already
> > given the userspace portion a thumbs-up.  Have you started on the
> > audit-testsuite test for this yet?
>
> yep, it's ready.. waiting for kernel change ;-)
> https://github.com/olsajiri/audit-testsuite/commit/16888ea7f14fa0269feef623d2a96f15f9ea71c9

Seeing tests for new features always makes me happy :)

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

