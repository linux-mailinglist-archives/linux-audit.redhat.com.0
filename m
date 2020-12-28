Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 94F4D2E6A92
	for <lists+linux-audit@lfdr.de>; Mon, 28 Dec 2020 21:09:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-UxNR5rX5NwaVbHlv1gqUbQ-1; Mon, 28 Dec 2020 15:09:15 -0500
X-MC-Unique: UxNR5rX5NwaVbHlv1gqUbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F12088015A8;
	Mon, 28 Dec 2020 20:09:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7974118219;
	Mon, 28 Dec 2020 20:09:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BE8118095C9;
	Mon, 28 Dec 2020 20:09:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BSK6WNX004157 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 28 Dec 2020 15:06:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 58EAD2166B28; Mon, 28 Dec 2020 20:06:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53C222166B27
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 20:06:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6C638007DF
	for <linux-audit@redhat.com>; Mon, 28 Dec 2020 20:06:29 +0000 (UTC)
Received: from sonic317-38.consmr.mail.ne1.yahoo.com
	(sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-558-j6X9pWaHOXOkNrS7yywKTg-1;
	Mon, 28 Dec 2020 15:06:27 -0500
X-MC-Unique: j6X9pWaHOXOkNrS7yywKTg-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1609185986; bh=4Cxx3YpjZ3C5iG7rLwC66A6nTNFHE/8m1yqTy9NSdpk=;
	h=Subject:To:From:Date:From:Subject;
	b=lEoLZTAbxND96Q2UxRupGMNW5qx2JU4uhJUIhfNicqZY9pD0y41e3v+ESeO0Oz675eAJx68O9apdglcVUJwjFXIWHSgBuMXzS9eTSmlEvRa3Xb51iG/hL6amwBcXku/CfIeVko2bHGycv95fq1GyCp3/hBW6HEujvse4jURS9He4gkPONAWWha5wYz3mTFC6wWgdM5IoM0OOJlEKKiqB1QP0Mwi0I78+SINOqajZc7lvArUBiSwkJ8GDdwqamW7qBh4KRbRPu8ptR48V9qB8A6aHL0+MtDZ8tYR2nPlmhSKIiqdo3fw83912IIc9+NS9Y0kE0OpkL64QPOoRxn8+Bw==
X-YMail-OSG: pgTuvrAVM1l7NYsNNBbxGy0EZFHz4n1shaJGzloNw0Ls_GpWFA1yPxU46IZG4oU
	nDAFXsKaSVEYydEYA1nzCrqYpByQL1AyI76p8698eUhqhCXtAj5pD5Ger3zJZmfYPrIKSxUa9FkV
	enbr5ekxvueDX6q6QtFiFbBudXzsW2i5_70ABOyD_uxxz6qzUJ1mgiSo043R9Y999dGvl8xI59..
	6jGpcP7vi7.lRtYAnlPcnPGSW0.OtdnCBYaHhEBUPQ8hoZfy3iDENCHR04KGZnGx8ddP0RXpVY1Y
	9hoKV81iwEMLvq0GrnfkB1Q5IZ8GBxHIPNacZ4VSyvSXif_EzQAh7NenuXf2j6NLrNb5RoyTqA6G
	Yn94eJAb04Gn8g_GsQEU.AW5axp1bPnPqvzzgxMlx7nyjhAizGA9mo.DVWI.eIHBZpyHZju4zStY
	zzaqom3Z4ipgUtZTWlUs95hdfyhgsf1VQYU07Ps9WuoLvKSz3P7PGMOphIzldzxjfaT8HOcfoNm7
	wPgB_gDzRKj3I0XkuNwPaoZitjZpj9ZI7ymll7EYE8IJJdnaYT5fz0VH4Atdeexv0khiTjIcEkEJ
	0SMhUrbjDn8B_7rx19_drff2XDPLc09DunPdDkH.2rU_hwKPBrS4cU7hMzYsmPPZCXHFIp6.k8iG
	WFyXmQc7CoEVxRuktkLUJCUF6_WYjG2CN6HuGysZjdzZxX2W90.9qOTl5VIW371Js8lVdjM4N2eD
	H1AwxRSuWx_Bkk6RpxMOL5zJDGiqvjjCguRiLeb8hCHM4mN_FqiUx2vlUktUBgOfGmk_EVwQi_mJ
	JaFWWdBHOLxpLbc7d1mcjKTHd8srpB6_oimrhmKqoGrKAim.Uq5INVpUbqa8clC5sGf6paSZsgbK
	99ERcVHsgfKWapjX8j_4M6tXMrBvOMR.P6WWb2idBBPOEWt86gqC0OBMrXYSewYF._vlXIYP.QU7
	A9bKnmHkVnfoFFDi3Ygs4LTlsvvMZR0svIE70Q0PzlvSGxgowqPr9XL7seGYJ_gFDocdaJsn1jYs
	Za8OH_W5_Na9KT7eAV1WrZwUJrxiSMG6JGFc235rf4yLUNpRQnjOWTNHdNTpyeprB86vreZpIZTG
	32qY0.4OlcUN.nXrexa7iLxnxbMMbIAjDrmoCPIzhYA9m3FtrJjGEoFHfoGyMuUP4nLlRVvjk6Zl
	6GjvgpUB.U3POoRF9TD_QZKokoaVei0edwDKZgjZr_VadOkK56hOPZp4bmJtQOkb1TT9tTieTFYg
	RkwZOetItWEYvrJu7qqajXdvE_cO32bczXXy6h6DEL7aXuzLrSKIxoLGaZUyrcMx3LOCE9nphPFv
	GSlfi8T2jPXttlwJtukCss.SgkUy9ly3RRWVNdKk3N_qJuggxfyHZ5tXXga5U5SPBzqhTP466KXI
	zK3.LYSDgWCzkuOQstIwH.GaJKO4IyRcXz31XERVBsrocM4ZZ6GQCrPSSzt6gEPbuvj7meR21r8a
	6OyiAbLcBkgazcCWwM.Y5F04OrLvtI1itKyT7jnjUDUYLDs6hrLLLMdMRqh70_RWoz6cb1.mtlMt
	zCo4f_6a_kuQGUC8cybCU4UI_xzjXxOLfyVU1R4XLqZ5TyU7rSk4hZX1HiCwg0X_Mt6fbd.zyRWQ
	hPH4GPBat8mfrZ7qfk0iyKKiUgl7dWOQCG50dUBs1EM0D1E9_ZLv3Npl0WSMToKXqtZviqwalG3C
	ycJ7XBYsRVQdLMjB8FEtnF76OuG_uVf29TXud_natS02DYhpoFop1A8pBFdQ8xYhzfLPtndozCLG
	MKwAeoNlSYkF37AAU4GTkiED9atwPtrCeL1.NlUhamtSYO3hDrTN_DVNao5eEWi3WHrWc7PT0ubj
	9lZrf5jJ_xQeURGKWqd1JTy0AaByzKNKvxJbSE.IUJXKVi0uaihdo605XTLR0tZ2Ew3UW46tNu3F
	NMU0lDuD8JRQ01QR.Y.4ayTsfHZGJHRUt3EUVOAMe4vs22hhuXUhuInF_GXZPLLdk7dZDgqKq9i6
	NcOWd3JIY8vpVLZZlmGiOZ9l1slV6GKXzxXLzMTHh4PAW4h0ufEoA390knhhDou7t2Ya8rzfGqje
	mTwb9jx.YVfuGasUweoL3PuZvIxiMOXSEnV3S_2QALRvtYe3zhUoQ.8HGSoI8fDOlVo9pbM4TEgZ
	KwSAWQs_kCIRBLANQ2RIMzGMO4rFKn6FuhPtDMKOsTRz2NbuKJA3ybvk6m7tJ0U09rQIeEJMhJa8
	fRE7u7KtZg0mNipzhA9gWP6eXFQrF1F.6pFAUBXsjgfEhi0j2E05A7MkuuMOfARlas9D5Knt8qRs
	wslxJa.MqhTTWIvcSZeBM7nPrc9nKUTjy1av_3.IBBK1cDdS46cYXzB6SmzRpKaHmYgDUyL1AnHt
	GA7hrZxOAIfokT0s6N0HplDbmxSqEUHaULV2o1fu8wPwYSbpX_6vLuhaEh1jchwetZnarFeXKZP2
	7pIKiE6Ln9e3XfNZYDTHUSDJrwoLA7IIphHYquOKGzcUR57AxIx0BUTPwJGVwdidva2YJdcM7xRj
	SApOuqdjjoILetS92yptMxneW4UA.9m1ddTLKdF.tPYhlHHVflJmwRXOjwqkVX.ulJPr9tZXb.HO
	65oRfeYPvhdgN3ixeBQf3ytWEeRpPASLGnRyJm_a0Tj35pmYGTv.d9KJJvZVm2AmwPRRtnOlTqGB
	Qs6xiIz5ZKae1FPyVGkMucrQOknycTrG25oRtsOF7_.fA3Qs3QPhJayVbDH0tbGnr37okOX2PP.T
	VfahQBTUFBbjnCBu8IHFkySYXAdhbc5CWESX9ikAHxOZ1AgkKIwrx6_Bs.wr9HDfCPX5IZ7Z1qJj
	tslI9cGu.nVYsNiTukXspH86.fz.ZyS.DPe7R1Acfc2JVd9pBhOR06Qf89gfInfWjtB3UDqLxkny
	QaC1SR0hUUrf90Obgw8SlnYJS_MUv4cVIMqC1sEh.yyi074Gl33eIxPc42EaPTjvBQV8wHMmFdH_
	kbHmjHW0xvQl6gONAAuhBIKq8IN8h1Vijmsy6azdFsIOFAmSlbuFNSpMdypzGmaUwNnuugw1yULQ
	tenWfskchET6L27SJ64zAlgKJZSRXabVK
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Mon, 28 Dec 2020 20:06:26 +0000
Received: by smtp421.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID b01905f8d95e2b254c7aa58e888394de; 
	Mon, 28 Dec 2020 20:06:26 +0000 (UTC)
Subject: Re: [PATCH v23 02/23] LSM: Create and manage the lsmblob data
	structure.
To: Mimi Zohar <zohar@linux.ibm.com>, casey.schaufler@intel.com,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
References: <20201120201507.11993-1-casey@schaufler-ca.com>
	<20201120201507.11993-3-casey@schaufler-ca.com>
	<b0e154a0db21fcb42303c7549fd44135e571ab00.camel@linux.ibm.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <886fcd04-6a08-d78c-dc82-301c991e5ad8@schaufler-ca.com>
Date: Mon, 28 Dec 2020 12:06:24 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b0e154a0db21fcb42303c7549fd44135e571ab00.camel@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BSK6WNX004157
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, bpf@vger.kernel.org, sds@tycho.nsa.gov
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/28/2020 11:24 AM, Mimi Zohar wrote:
> Hi Casey,
>
> On Fri, 2020-11-20 at 12:14 -0800, Casey Schaufler wrote:
>> diff --git a/security/security.c b/security/security.c
>> index 5da8b3643680..d01363cb0082 100644
>> --- a/security/security.c
>> +++ b/security/security.c
>>
>> @@ -2510,7 +2526,24 @@ int security_key_getsecurity(struct key *key, char **_buffer)
>>
>>  int security_audit_rule_init(u32 field, u32 op, char *rulestr, void **lsmrule)
>>  {
>> -       return call_int_hook(audit_rule_init, 0, field, op, rulestr, lsmrule);
>> +       struct security_hook_list *hp;
>> +       bool one_is_good = false;
>> +       int rc = 0;
>> +       int trc;
>> +
>> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_init, list) {
>> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
>> +                       continue;
>> +               trc = hp->hook.audit_rule_init(field, op, rulestr,
>> +                                              &lsmrule[hp->lsmid->slot]);
>> +               if (trc == 0)
>> +                       one_is_good = true;
>> +               else
>> +                       rc = trc;
>> +       }
>> +       if (one_is_good)
>> +               return 0;
>> +       return rc;
>>  }
> So the same string may be defined by multiple LSMs.

Yes. Any legal AppArmor label would also be a legal Smack label.

>>  int security_audit_rule_known(struct audit_krule *krule)
>> @@ -2518,14 +2551,31 @@ int security_audit_rule_known(struct audit_krule *krule)
>>         return call_int_hook(audit_rule_known, 0, krule);
>>  }
>>
>> -void security_audit_rule_free(void *lsmrule)
>> +void security_audit_rule_free(void **lsmrule)
>>  {
>> -       call_void_hook(audit_rule_free, lsmrule);
>> +       struct security_hook_list *hp;
>> +
>> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_free, list) {
>> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
>> +                       continue;
>> +               hp->hook.audit_rule_free(lsmrule[hp->lsmid->slot]);
>> +       }
>>  }
>>
> If one LSM frees the string, then the string is deleted from all LSMs. 
> I don't understand how this safe.

The audit system doesn't have a way to specify which LSM
a watched label is associated with. Even if we added one,
we'd still have to address the current behavior. Assigning
the watch to all modules means that seeing the string
in any module is sufficient to generate the event.

>
>> -int security_audit_rule_match(u32 secid, u32 field, u32 op, void *lsmrule)
>> +int security_audit_rule_match(u32 secid, u32 field, u32 op, void **lsmrule)
>>  {
>> -       return call_int_hook(audit_rule_match, 0, secid, field, op, lsmrule);
>> +       struct security_hook_list *hp;
>> +       int rc;
>> +
>> +       hlist_for_each_entry(hp, &security_hook_heads.audit_rule_match, list) {
>> +               if (WARN_ON(hp->lsmid->slot < 0 || hp->lsmid->slot >= lsm_slot))
>> +                       continue;
>> +               rc = hp->hook.audit_rule_match(secid, field, op,
>> +                                              &lsmrule[hp->lsmid->slot]);
>> +               if (rc)
>> +                       return rc;
> Suppose that there is an IMA dont_measure or dont_appraise rule, if one
> LSM matches, then this returns true, causing any measurement or
> integrity verification to be skipped.

Yes, that is correct. Like the audit system, you're doing a string based
lookup, which pretty well has to work this way. I have proposed compound
label specifications in the past, but even if we accepted something like
"apparmor=dates,selinux=figs" we'd still have to be compatible with the
old style inputs.

>
> Sample policy rules:
> dont_measure obj_type=foo_log
> dont_appraise obj_type=foo_log
>
> Are there any plans to prevent label collisions or at least notify of a
> label collision?

What would that look like? You can't say that Smack isn't allowed
to use valid AppArmor labels. How would Smack know? If the label is
valid to both, how would you decide which LSM gets to use it?

>
> Mimi
>
>> +       }
>> +       return 0;
>>  }
>>  #endif /* CONFIG_AUDIT */


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

