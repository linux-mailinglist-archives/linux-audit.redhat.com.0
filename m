Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9E771DC1
	for <lists+linux-audit@lfdr.de>; Tue, 23 Jul 2019 19:32:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE05C8552A;
	Tue, 23 Jul 2019 17:32:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A18660852;
	Tue, 23 Jul 2019 17:32:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6DED1972D;
	Tue, 23 Jul 2019 17:32:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6NHWQTU008522 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 23 Jul 2019 13:32:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8539A5C28C; Tue, 23 Jul 2019 17:32:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FB335C234
	for <linux-audit@redhat.com>; Tue, 23 Jul 2019 17:32:24 +0000 (UTC)
Received: from sonic316-12.consmr.mail.gq1.yahoo.com
	(sonic316-12.consmr.mail.gq1.yahoo.com [98.137.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF62B309264D
	for <linux-audit@redhat.com>; Tue, 23 Jul 2019 17:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1563903141; bh=1FB4F/65NJ5O0uG4nTAIVJ1QPXqodWyC4P758opMWdI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
	b=EmPzWLcV36MXPYX2xCjdmCAubSVAUAb2fJAA79jSaY1oySq+YbCnrFdySWMtggQDGMLFGwV/avELtDwYt8dnl46u21ISXZ/z0RfCdR3QgzDDS3Rc2kqtHXh/Zdqy4d58o/9FMKVwm+Tqwls8OVbgtoouXdMKK8PMMue0ARI+OrZjsdE6SwplsLUjGEu7B/zZz15WEb3pLloDO6Bb7/f7aqVGHdA42PgocWthb+Xfudbb8Q4VM3EoiycYLbFpSdc9XydisTvuyYs1AJvP+0WGoS2q00zUKgp1YUUyqiMaxfO8sYpKobTner+bq4pPJ/ET1hCZgVSCGGAbNynsnVhamA==
X-YMail-OSG: Si9xEFQVM1n3MCV7BzyA4Uyvopnnu8sBu7y_vEDVPTk02PNXUgrVuvYh65BKig_
	h3naceFTUUbaq4FBEF.xivL2GCM2y4JF9nZ8xy03ksImwO8RhtJ0udGmF6z5fMPnUNl0O1LUAe6g
	xWRsbZ6zsok95HQfI1E5lqTVCPO0XKYzt8XVipzSe0A1gOmFGHxcgaEk6TcEDREgvI_jewviAK2R
	1P0kaHKUU3dGxfJUYeU1JK3oDgS2x2NIijQ.fd_k_pQ9HW0zNC77YLu4Y4qJ_YYGe5_vbaMz9N82
	GmJWwTeeaHVjDdbSBKU6dDZM0U8RpMBMKMQY.mXnaAhx4LAb4eWSl1LvFk5FMUKPuyYx3YeOa1.v
	P1hfNVWgMrFsLv1lYp6jVQCnCRWTX5MEVD8dgfLN7EATiuslQJ4gPcUxX1tM_peGfosw8sMyZVzM
	qyQXQv.AS.W8tUfBalaB1TiEoIX5mECdv1CGFUJEgkatMbGYC1_xuVvb4QOYjCXDssHNBXOo4qOm
	r_icbrFKO31GWbCuw8cMARzPDiEnXLqsSMGCgE8WFM_56TzZW8soYDKODISJ8SY74GVfF6t.tb0k
	CufSxYOvVq8tnYYEw6F7FKSlGD2ROyEsiLw_7..s45xVeCnrvsMuxBszkMF5vsaNgO7qh9.fFY24
	OEiggQMRrerwcKNPmhS6cS9yV89bZ8q_QUQShNeBy2vmg6_pMRKKI0d8YoE.RciH.8CVduLFIsLc
	ztUv.Yw_TIPFqyH154HJf6ebLkiov1gETeR5T0ugx8k3P6EHzcUb6RLoTX75SawfCu3FJhh7K.w0
	7gA1hHG3il6s2W0Df.KGV5893M2kwLNBiUGNX_VieXUq6jbElxedbphuHE4s.re4jP.Csf_qO9nx
	hs67WxlLCfFoo9XgMWZhGdip3y6bb4_WPYzhQWDHZ_ljQTiafZ_xGH_LRHcevurU0D0Ywa6FjFJz
	PIgEjhe3dCEm3DjT1MIXpDtysE0Jywk2ojcahiI5oWzr7r9ezlsLshAPWWaFSoNX.JGo5w3VROoA
	uQX6oDylIWAbFhr5U3NMWrCawi8S7nY2PFIlBeaEV.ribH0ZnATKwhKnciskruFz11UymNbeS2a.
	y3_obhw2czdyD8ggAqphwEYi3uDqok04apoOjQHpFMuuqWzOzWExC4mOEpRssKboI5qlMWvVZ5NI
	Wk9VL0xGSQ6hGJ5K5LQ0s_e0r.y8a8uvgGyLLGlkZ.Qth8VI9siz6G8XzYbi_AxaTmhsnbNaVL2G
	UKbaqukCxDmYHawwP81.UQu8-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.gq1.yahoo.com with HTTP;
	Tue, 23 Jul 2019 17:32:21 +0000
Received: by smtp425.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID 2a18cd045836b652c62503b303822ec9; 
	Tue, 23 Jul 2019 17:32:18 +0000 (UTC)
Subject: Re: Preferred subj= with multiple LSMs
To: Simon McVittie <smcv@collabora.com>, Paul Moore <paul@paul-moore.com>
References: <CAHC9VhTpcnyGg5j3b6Z7Yi0Ob01JETRiBmz1AuLqPWqP9tEAnA@mail.gmail.com>
	<5ea2a25b-364f-3c30-79c6-cfb18515d7ba@schaufler-ca.com>
	<CAHC9VhQ9MSh5zCkhMja4r9j0RT952LwKSaG5dR-BqXzXrtEAUw@mail.gmail.com>
	<e9cf875a-0d0f-a56f-71dd-c22c67bdcc2d@schaufler-ca.com>
	<CAHC9VhQS9We1TNqRfuR_E-kV4aZddx9euaiv5Gzd5B5AkiDAUQ@mail.gmail.com>
	<f375c23c-29e6-dc98-d71c-328db91117bc@schaufler-ca.com>
	<CAHC9VhTf0yYDZBxOtfv2E5=GtrBYonoqr46hyBy7qdNdjVLoVg@mail.gmail.com>
	<alpine.LRH.2.21.1907230649460.18217@namei.org>
	<ca22ea45-3f3b-4f79-8d77-7528877b8b36@schaufler-ca.com>
	<CAHC9VhSbg7BxPSA4NkQV3_1zx6cj3ej25e6fJ2FBWX9fU104rg@mail.gmail.com>
	<20190723140634.GA30188@horizon>
From: Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <ca106e38-ad43-86a3-dc7c-983750e1001c@schaufler-ca.com>
Date: Tue, 23 Jul 2019 10:32:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723140634.GA30188@horizon>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Tue, 23 Jul 2019 17:32:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Tue, 23 Jul 2019 17:32:22 +0000 (UTC) for IP:'98.137.69.36'
	DOMAIN:'sonic316-12.consmr.mail.gq1.yahoo.com'
	HELO:'sonic316-12.consmr.mail.gq1.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 98.137.69.36 sonic316-12.consmr.mail.gq1.yahoo.com
	98.137.69.36 sonic316-12.consmr.mail.gq1.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6NHWQTU008522
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, James Morris <jmorris@namei.org>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 23 Jul 2019 17:32:46 +0000 (UTC)

On 7/23/2019 7:06 AM, Simon McVittie wrote:
> On Mon, 22 Jul 2019 at 18:30:35 -0400, Paul Moore wrote:
>> On Mon, Jul 22, 2019 at 6:01 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>> I suggest that if supporting dbus well is assisted by
>>> making reasonable restrictions on what constitutes a valid LSM
>>> "context" that we have a good reason.
>> I continue to believe that restrictions on the label format are a bad
>> idea
> Does this include the restriction "the label does not include \0",
> which is an assumption that dbus is already relying on since I checked
> it in the thread around
> <https://marc.info/?l=linux-security-module&m=142323508321029&w=2>?
> Or is that restriction so fundamental that it's considered OK?
>
> (Other user-space tools like ls -Z and ps -Z also rely on that assumption
> by printing security contexts with %s, as far as I know.)

The "-Z" options for ls and ps are unfortunately hard coded for SELinux.
For applications to be general in the presence of LSMs you are correct
that there need to be some assumptions.

> dbus does not require a way to multiplex multiple LSMs' labels in a
> printable text string, so from my point of view, multiplexed labels do
> not necessarily have to be in what Casey calls the "Hideous" format,
> or in any text format at all: anything with documented rules for parsing
> (including the unescaping that readers are expected to apply, if there
> is any) would be fine. Based on the assumption of no "\0", I previously
> suggested a "\0"-delimited encoding similar to /proc/self/cmdline, which
> would not need any escaping/unescaping:
>
>     "apparmor\0" <apparmor label> "\0"
>     "selinux\0" <SELinux label> "\0"
>     ...
>     "\0" (or this could be omitted since it's redundant with the length)
>
> which would be fine (indeed, actually easier than the "Hideous" format)
> from dbus' point of view.

I am an advocate of a single string due to the preponderance of
scripting language programing in today's world. It would be easy to provide
a library function to transform the "Hideous" format into the "cmdline"
format or, I'll admit, the other way round. I'm not so set in my opinion
that if it came down to "cmdline" or nothing I wouldn't cave in.

> dbus does not strictly need reading security labels for sockets or
> processes to be atomic, either: it would be OK if we can get the complete
> list of LSM labels *somehow*, possibly in O(number of LSMs) rather than
> O(1) syscalls (although I'd prefer O(1)).

Stephen Smalley did an excellent job of outlining the dangers of
using the proposed "display" mechanism with multiple calls to
get the complete attribute set. Adding a new interface that gets
them all at once addresses that set of problems.

> However, the getsockopt() interface only lets the kernel return one thing
> per socket option, and I assume the networking maintainers probably don't
> want to have to add SO_PEERAPPARMOR, SO_PEERSELINUX... for each LSM -

Or a getsockopt() option that takes an LSM name and returns the value
for that module. You could do any of those, but you still end up with O(n)
and a need to know in advance what security modules to look for.

> so this part at least would probably be easier as a single blob in some
> text or binary format.

For the long term I agree. I still have to deal with legacy services
and applications that won't be updated in the foreseeable future, which
is why the old interfaces can't be updated. New interfaces are required.
I'm open to discussion on details, including format.

>     smcv


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
