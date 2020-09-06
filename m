Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1EABD25EC53
	for <lists+linux-audit@lfdr.de>; Sun,  6 Sep 2020 05:28:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-sOqJIsLyMqe2i4zPo0giZw-1; Sat, 05 Sep 2020 23:28:49 -0400
X-MC-Unique: sOqJIsLyMqe2i4zPo0giZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BAC7801AD9;
	Sun,  6 Sep 2020 03:28:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48B2F19D7D;
	Sun,  6 Sep 2020 03:28:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7947F180B655;
	Sun,  6 Sep 2020 03:28:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0863S7hT026177 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 5 Sep 2020 23:28:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0B85200A799; Sun,  6 Sep 2020 03:28:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B9572028CCE
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 03:28:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 543B3185A78B
	for <linux-audit@redhat.com>; Sun,  6 Sep 2020 03:28:05 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-379-t5xWg-WUN3iTjuNuC15HFw-1; Sat, 05 Sep 2020 23:28:03 -0400
X-MC-Unique: t5xWg-WUN3iTjuNuC15HFw-1
Received: by mail-ej1-f67.google.com with SMTP id e23so13512690eja.3
	for <linux-audit@redhat.com>; Sat, 05 Sep 2020 20:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f0IgnZUyUoGfbZraUIscu29c3A3sScGsdLF190biM3Y=;
	b=lDiabXBCc8DnIBTlQjfnwfW3Ku/tBj/SYnKl3FxZQ7uWVa6ionuWzYhRd/t/kb4YmS
	KS7Wt5qRq49HzRpbePLi534dT3Ah8MJ5DKs2B/qRx35XyF+ZawpJcdNjvWEwXGPZyhm8
	QKiABKseDBYnB8Gd1QTi+tMSoz/iZwlOiQVEDZ9zj3mqcmcSC8t+Xc3vrcpmVDAnqVpm
	s45v3GXVHxguA4jzhEV6aRMf/Svef478tv5yW8zt6lZBQjsQcn96kbbqb4xBCnvZaAXY
	iNhffXxBcsaq8mzNxqNSgshAw5Wo8CGyVLqJan/acCywnMfRaiwMiTrUHSeBJF5Gy8Hq
	sdaQ==
X-Gm-Message-State: AOAM532sGk6dEK3FQl71iq7YinWBkvSTwBsDK/ew3aWRqsd0SvikOnUA
	vWiLtYwa/a9sM42HjAV/6Pk5VidkIAMg9PkzmM5a
X-Google-Smtp-Source: ABdhPJzP4OcqWMTHX8gja+wmbDgmPTy3466oa2U/qwS83qgEv2/iYRIddsUSymGA/uzzioCH0LFF+C/hnfg9g6+CLc8=
X-Received: by 2002:a17:906:15d4:: with SMTP id
	l20mr14513986ejd.178.1599362881963; 
	Sat, 05 Sep 2020 20:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-19-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-19-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 5 Sep 2020 23:27:50 -0400
Message-ID: <CAHC9VhSQCbzKToSsD23bWs5=cVh1vgMcpSvj+Bv_bZwfsOUtgQ@mail.gmail.com>
Subject: Re: [PATCH v20 18/23] NET: Store LSM netlabel data in a lsmblob
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	netdev@vger.kernel.org, James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:21 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Netlabel uses LSM interfaces requiring an lsmblob and
> the internal storage is used to pass information between
> these interfaces, so change the internal data from a secid
> to a lsmblob. Update the netlabel interfaces and their
> callers to accommodate the change. This requires that the
> modules using netlabel use the lsm_id.slot to access the
> correct secid when using netlabel.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: netdev@vger.kernel.org
> ---
>  include/net/netlabel.h              |  8 +--
>  net/ipv4/cipso_ipv4.c               | 27 ++++++----
>  net/netlabel/netlabel_kapi.c        |  6 +--
>  net/netlabel/netlabel_unlabeled.c   | 79 +++++++++--------------------
>  net/netlabel/netlabel_unlabeled.h   |  2 +-
>  security/selinux/hooks.c            |  2 +-
>  security/selinux/include/security.h |  1 +
>  security/selinux/netlabel.c         |  2 +-
>  security/selinux/ss/services.c      |  4 +-
>  security/smack/smack.h              |  1 +
>  security/smack/smack_lsm.c          |  5 +-
>  security/smack/smackfs.c            | 10 ++--
>  12 files changed, 65 insertions(+), 82 deletions(-)

Minor change suggested to a comment below, but looks good otherwise.

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/net/ipv4/cipso_ipv4.c b/net/ipv4/cipso_ipv4.c
> index 2eb71579f4d2..8182b923e802 100644
> --- a/net/ipv4/cipso_ipv4.c
> +++ b/net/ipv4/cipso_ipv4.c
> @@ -106,15 +106,17 @@ int cipso_v4_rbm_strictvalid = 1;
>  /* Base length of the local tag (non-standard tag).
>   *  Tag definition (may change between kernel versions)
>   *
> - * 0          8          16         24         32
> - * +----------+----------+----------+----------+
> - * | 10000000 | 00000110 | 32-bit secid value  |
> - * +----------+----------+----------+----------+
> - * | in (host byte order)|
> - * +----------+----------+
> - *
> + * 0          8          16                    16 + sizeof(struct lsmblob)
> + * +----------+----------+---------------------+
> + * | 10000000 | 00000110 | LSM blob data       |
> + * +----------+----------+---------------------+
> + *
> + * All secid and flag fields are in host byte order.
> + * The lsmblob structure size varies depending on which
> + * Linux security modules are built in the kernel.
> + * The data is opaque.
>   */
> -#define CIPSO_V4_TAG_LOC_BLEN         6
> +#define CIPSO_V4_TAG_LOC_BLEN         (2 + sizeof(struct lsmblob))
>
>  /*
>   * Helper Functions
> @@ -1469,7 +1471,12 @@ static int cipso_v4_gentag_loc(const struct cipso_v4_doi *doi_def,
>
>         buffer[0] = CIPSO_V4_TAG_LOCAL;
>         buffer[1] = CIPSO_V4_TAG_LOC_BLEN;
> -       *(u32 *)&buffer[2] = secattr->attr.secid;
> +       /* Ensure that there is sufficient space in the CIPSO header
> +        * for the LSM data. This should never become an issue.
> +        * The check is made from an abundance of caution. */
> +       BUILD_BUG_ON(CIPSO_V4_TAG_LOC_BLEN > CIPSO_V4_OPT_LEN_MAX);

I like the BUILD_BUG_ON() check, but for reasons very similar to the
unix_skb_params changes I don't really like the "should never become
an issue" commentary.  Granted, it is unlikely, but I don't think it
is wise to thumb our nose at fate.

> +       memcpy(&buffer[2], &secattr->attr.lsmblob,
> +              sizeof(secattr->attr.lsmblob));
>
>         return CIPSO_V4_TAG_LOC_BLEN;
>  }

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

