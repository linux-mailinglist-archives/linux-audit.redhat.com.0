Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6C12FC73
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 15:37:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0469D30C5827;
	Thu, 30 May 2019 13:37:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 788AF6F95D;
	Thu, 30 May 2019 13:37:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BA7C1806B0F;
	Thu, 30 May 2019 13:36:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UDa1KX013877 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 09:36:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B087410027CA; Thu, 30 May 2019 13:36:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABF431009976
	for <linux-audit@redhat.com>; Thu, 30 May 2019 13:35:59 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 500AEC0AF05B
	for <linux-audit@redhat.com>; Thu, 30 May 2019 13:35:50 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id z5so6053102lji.10
	for <linux-audit@redhat.com>; Thu, 30 May 2019 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/U1f8Fc02eyDkuGsWIDz5srojNJJU/zoTrLNm2qEEYE=;
	b=PcjCE05Vr6571Z0FZcLJcqv+cvaAJeL7YpbARuQ2LSZIHBxhkDAdsF9jD7NhDOKngU
	6X1SX5q77QkN9n3E19d4YHs9c0CtfyLSRuUuSdOXluMQYnqok+2LuhQnfV6Yvt5gokXc
	rv1Y97UwU29b5+KdfE/UeKLzGLNovyUXymuMuyGyAd1g6N0pG2/4sWOP2UBIUSzYLfHX
	V1r+bdOV/ByhYIvgWgk1An0M77FfT6aJutWDNqmHH2KjEzC70mCUzzpod9jb6FNa/AtR
	MEO9qpdFx+xNcpWYtV4mCZ49HXeovOfghdnPjt29AHlHiv/t+7uoYA1WS7kIwbDGPK1R
	tWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/U1f8Fc02eyDkuGsWIDz5srojNJJU/zoTrLNm2qEEYE=;
	b=cmZA440EesjnLjQQ1iZ3UVKr9No4VD2W3+7c8an0LvKdr+iY8i+3s3/BbqLRRMlgK4
	33H2SqYpY0Fp5q2NVUoCLdiUFSgHiWK0uXWI4zDNIinQw360NpTIfDkbfuprYJwtM2Qu
	km+7BTSTkJ+SQL2uCtEupnZPMhrFVxQXRZfCf3uF5foxTRdzFuutGqWy/Mmf7LMRE3Es
	W1Za8PjsWbw6+zrqUQpqepKqEwgt6zcrujtZQc4gyaI51Ki27uMiqVUVihNqzMs42Ggh
	R35dbTg49kAYwULpwYnqI2Ez8cOBMzQisSfmVcwTB3PSeoxoREorwxyhQSvhOL0ZTwTm
	shJg==
X-Gm-Message-State: APjAAAX6ZtZ/8erxQ6o/qHSZcTcDr6fBosIWVKEeBg0GidTuZc7lhSx6
	+GEu3ZXEkr+DE7gDDQ40xLLmaUkgQ1VHhGP6ghe0
X-Google-Smtp-Source: APXvYqxLKiEME9EKDe015SLMtCLzjMQupiY0eTQcPEupXRnKhW/v5gEX9weuoubW+5N0jXscBR8tMiamdrFu8nfWc0w=
X-Received: by 2002:a2e:3e14:: with SMTP id l20mr2252084lja.40.1559223348494; 
	Thu, 30 May 2019 06:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<CAHC9VhQYPF2ma_W+hySbQtfTztf=K1LTFnxnyVK0y9VYxj-K=w@mail.gmail.com>
	<CAHC9VhTQ0gDZoWUh1QB4b7h3AgbpkhS40jrPVpCfJb11GT_FzQ@mail.gmail.com>
	<1674888.6UpDe63hFX@x2>
In-Reply-To: <1674888.6UpDe63hFX@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 May 2019 09:35:36 -0400
Message-ID: <CAHC9VhQqiaHRxZkOZO2c5UzMOQ_NNu1pEsc4fQDX=Hj-HnGUoQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 00/10] audit: implement container identifier
To: Steve Grubb <sgrubb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 30 May 2019 13:35:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Thu, 30 May 2019 13:35:50 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 30 May 2019 13:37:21 +0000 (UTC)

On Thu, May 30, 2019 at 9:08 AM Steve Grubb <sgrubb@redhat.com> wrote:
> On Wednesday, May 29, 2019 6:26:12 PM EDT Paul Moore wrote:
> > On Mon, Apr 22, 2019 at 9:49 AM Paul Moore <paul@paul-moore.com> wrote:
> > > On Mon, Apr 22, 2019 at 7:38 AM Neil Horman <nhorman@tuxdriver.com>
> wrote:
> > > > On Mon, Apr 08, 2019 at 11:39:07PM -0400, Richard Guy Briggs wrote:
> > > > > Implement kernel audit container identifier.
> > > >
> > > > I'm sorry, I've lost track of this, where have we landed on it? Are we
> > > > good for inclusion?
> > >
> > > I haven't finished going through this latest revision, but unless
> > > Richard made any significant changes outside of the feedback from the
> > > v5 patchset I'm guessing we are "close".
> > >
> > > Based on discussions Richard and I had some time ago, I have always
> > > envisioned the plan as being get the kernel patchset, tests, docs
> > > ready (which Richard has been doing) and then run the actual
> > > implemented API by the userland container folks, e.g. cri-o/lxc/etc.,
> > > to make sure the actual implementation is sane from their perspective.
> > > They've already seen the design, so I'm not expecting any real
> > > surprises here, but sometimes opinions change when they have actual
> > > code in front of them to play with and review.
> > >
> > > Beyond that, while the cri-o/lxc/etc. folks are looking it over,
> > > whatever additional testing we can do would be a big win.  I'm
> > > thinking I'll pull it into a separate branch in the audit tree
> > > (audit/working-container ?) and include that in my secnext kernels
> > > that I build/test on a regular basis; this is also a handy way to keep
> > > it based against the current audit/next branch.  If any changes are
> > > needed Richard can either chose to base those changes on audit/next or
> > > the separate audit container ID branch; that's up to him.  I've done
> > > this with other big changes in other trees, e.g. SELinux, and it has
> > > worked well to get some extra testing in and keep the patchset "merge
> > > ready" while others outside the subsystem look things over.
> >
> > I just sent my feedback on the v6 patchset, and it's small: basically
> > three patches with "one-liner" changes needed.
> >
> > Richard, it's your call on how you want to proceed from here.  You can
> > post a v7 incorporating the feedback, or since the tweaks are so
> > minor, you can post fixup patches; the former being more
> > comprehensive, the later being quicker to review and digest.
> > Regardless of that, while we are waiting on a prototype from the
> > container folks, I think it would be good to pull this into a working
> > branch in the audit repo (as mentioned above), unless you would prefer
> > to keep it as a patchset on the mailing list?
>
> Personally, I'd like to see this on a branch so that it's easier to build a
> kernel locally for testing.

FWIW, if Richard does prefer for me to pull it into a working branch I
plan to include it in my secnext builds both to make it easier to test
regularly and to make the changes available to people who don't want
to build their own kernel.

* http://www.paul-moore.com/blog/d/2019/04/kernel_secnext_repo.html

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
