Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 763B467D1B6
	for <lists+linux-audit@lfdr.de>; Thu, 26 Jan 2023 17:34:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674750850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hLOSwsUmPXGlCQ2v7ZHyS+Pf6oguBrtIYo9sgpbLMaU=;
	b=X3eMudIMFxQllifpI4genNY1JSihcgoi7Q4KMdvAr6Zf+FzikG5whbkBUxVB2nuiOoO8//
	MhHTPWJc5PbzTo9HuzIeTSJ2mUK2/J6ypLhLnVdmiD3hxm3TI3SgRKbNsplh4bfpxjQhQA
	A9OXccXZu0oC9DOMHfIeP808X/NyYqo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-8-K8p1PcMGmxPZ5syX3Ibg-1; Thu, 26 Jan 2023 11:34:08 -0500
X-MC-Unique: 8-K8p1PcMGmxPZ5syX3Ibg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9450985A588;
	Thu, 26 Jan 2023 16:34:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E02F0492B02;
	Thu, 26 Jan 2023 16:33:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6E81D19465BB;
	Thu, 26 Jan 2023 16:33:46 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 61ED6194658C for <linux-audit@listman.corp.redhat.com>;
 Thu, 26 Jan 2023 02:24:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 08EDF39D92; Thu, 26 Jan 2023 02:24:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0053351FF
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 02:23:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D01E63C01DE1
 for <linux-audit@redhat.com>; Thu, 26 Jan 2023 02:23:59 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-z4b0iur2MPGgwZIQnZUKlg-1; Wed, 25 Jan 2023 21:23:56 -0500
X-MC-Unique: z4b0iur2MPGgwZIQnZUKlg-1
Received: by mail-pl1-f182.google.com with SMTP id v23so733186plo.1;
 Wed, 25 Jan 2023 18:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YdzDiMhd5Z4Kbptw7LbpvnJl2K3L0BK+iFAqX7khznk=;
 b=cWKQ3LoRkq2yJUejFpLnrkED2LKr3msUYmGPeKxn1zz9oXsR2Q5y+uBNeQcluKW+Hb
 t3RYOIc3ExQTYLpI6hzcuYBj/SWWdUhatpoaAZ1lhjyniEeSuRQsANu6geJhcoezuexn
 2p4A6kFID76IX/8Y0c6UDG+PgC275wJuLtxBwwzp0N9TIvOMGwDZt1yO+zWAr6VRegI4
 Q+v50gsZDo6AJTpm1LmXUDfg/+diQibnpxpLW84XH+nCkK6Du1urF3rgBfcAwQdqN/aI
 3mBdOgOt2SPx8npCj1G242UNu68EiGAJQ5Ss3rfAVKGpu98B2MekgUQYevlSzX65x4h2
 M5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YdzDiMhd5Z4Kbptw7LbpvnJl2K3L0BK+iFAqX7khznk=;
 b=xTiQ9/Soj+rXF2+CcJm9yFLJPOBKPXqeay6RlqeLGLoGhOyTrcoq5tN3bl17u0Rffq
 iBLwEATOxQo8o1k/eDs521Hvs0ilc+an1/M6B6+z9SB3G7kX3pcBz7L29ppbKmR+Q14D
 VDkfUZw6GqxiJA1h1QB67Jck17BtoBorbcHvQkClx/3BXZnBYussoStlIKKpiMXQiRNR
 9DhsTqVVlNBxHvVZCIyalPt4GkSmoE3HYNZjWwyajAsrJ5UztEFVotvxBQYhTQ1xXRCT
 TBkBo5l4GQNQXaZ7LRk6X8sD8dqZmngjjJLgtHG3lktGnvvBgFkHBNjPtf/euMj7EDxI
 tl5Q==
X-Gm-Message-State: AO0yUKVMn84YJ0zp8pJAUdWKUCbGDfPFMBJDvwzJyF9GYksbSZj+RoHK
 aeOnmwRl8PRQ2QgqpScYbCU=
X-Google-Smtp-Source: AK7set928mFCsBjzluN+Hn1fMUpkX7L+xOL83MZOoHVwK3h3Rnfl0pQuSPbhnC4JnUGrnGbjsxX7hA==
X-Received: by 2002:a17:902:6b89:b0:193:6520:739a with SMTP id
 p9-20020a1709026b8900b001936520739amr171911plk.46.1674699834095; 
 Wed, 25 Jan 2023 18:23:54 -0800 (PST)
Received: from debian.me (subs02-180-214-232-79.three.co.id. [180.214.232.79])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a170902d48800b001960706141fsm72958plg.149.2023.01.25.18.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 18:23:53 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 8EE9110544A; Thu, 26 Jan 2023 09:23:50 +0700 (WIB)
Date: Thu, 26 Jan 2023 09:23:50 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jules Maselbas <jmaselbas@kalray.eu>
Subject: Re: [RFC PATCH v2 01/31] Documentation: kvx: Add basic documentation
Message-ID: <Y9HkNpD7iQG9WErv@debian.me>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-2-ysionneau@kalray.eu>
 <Y8z7v53A/UDKFd7j@debian.me>
 <20230125182820.GD5952@tellis.lin.mbt.kalray.eu>
MIME-Version: 1.0
In-Reply-To: <20230125182820.GD5952@tellis.lin.mbt.kalray.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Thu, 26 Jan 2023 16:33:45 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Marc =?utf-8?B?UG91bGhpw6hz?= <dkm@kataplop.net>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Julien Hascoet <jhascoet@kalray.eu>,
 Clement Leger <clement@clement-leger.fr>, linux-mm@kvack.org,
 devicetree@vger.kernel.org, Louis Morhet <lmorhet@kalray.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Guangbin Huang <huangguangbin2@huawei.com>, Alex Michon <amichon@kalray.eu>,
 Thomas Costis <tcostis@kalray.eu>, Jonathan Corbet <corbet@lwn.net>,
 Jonathan Borne <jborne@kalray.eu>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, bpf@vger.kernel.org,
 Samuel Jones <sjones@kalray.eu>, Ingo Molnar <mingo@redhat.com>,
 linux-arch@vger.kernel.org, Jean-Christophe Pince <jcpince@gmail.com>,
 Waiman Long <longman@redhat.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Qi Liu <liuqi115@huawei.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Luc Michel <lmichel@kalray.eu>, John Garry <john.garry@huawei.com>,
 Ashley Lesdalons <alesdalons@kalray.eu>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Yann Sionneau <ysionneau@kalray.eu>, Boqun Feng <boqun.feng@gmail.com>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Julian Vetter <jvetter@kalray.eu>,
 Nick Piggin <npiggin@gmail.com>, Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Rob Herring <robh+dt@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, WANG Xuerui <git@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>, Marius Gligor <mgligor@kalray.eu>,
 Janosch Frank <frankja@linux.ibm.com>, Julien Villette <jvillette@kalray.eu>,
 linux-audit@redhat.com, Christian Brauner <brauner@kernel.org>,
 Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, Oleg Nesterov <oleg@redhat.com>,
 Eric Paris <eparis@redhat.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eric Biederman <ebiederm@xmission.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============7332224038049758576=="
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10


--===============7332224038049758576==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zOhV12uQumLCQ78f"
Content-Disposition: inline


--zOhV12uQumLCQ78f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 07:28:20PM +0100, Jules Maselbas wrote:
> Hi Bagas,
>=20
> Thanks for taking your time and effort to improve the documentation.
> We not only need to clean the documention syntax and wording but also
> its content. I am tempted to apply all your proposed changes first and
> then work on improving and correcting the documentation.
>=20
> However I am not very sure on how to integrate your changes and give
> proper contribution attributions. Any insights on this would be greatly
> appreciated.
>=20

Hi Jules,

The reword diff can be squashed into the doc patch (here, [01/31]).

For the attribution, since the reword is significant,

Co-developed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--zOhV12uQumLCQ78f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY9HkLwAKCRD2uYlJVVFO
ownGAQCyX0e5qWZ8KCgW6jQ0b0lEDmtwh+WnXNpCfwV6NxpnGgD+ISGQ0LnDB1sd
Rr3pPueL92j0yk6OhCDekI4gR23BOwo=
=1//R
-----END PGP SIGNATURE-----

--zOhV12uQumLCQ78f--


--===============7332224038049758576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============7332224038049758576==--

